#!/usr/bin/env python3

import argparse
import re
import subprocess
from pathlib import Path


def extract_shell_script_contents(path: Path):

    lines = path.read_text().splitlines()

    # Remove shebang if present.
    if lines and lines[0].startswith("#!"):
        lines = lines[1:]

    # Trim leading and trailing blank lines.
    start = 0
    end = len(lines)

    while start < end and not lines[start].strip():
        start += 1

    while end > start and not lines[end - 1].strip():
        end -= 1

    cleaned = "\n".join(lines[start:end])

    return cleaned


def run_command(command: list[str]) -> str:
    """Run a command and return stdout (stripped)."""
    result = subprocess.run(
        command,
        capture_output=True,
        text=True,
        check=True,
    )
    return result.stdout.strip()


def inject_between_markers(
    file: Path,
    start_marker: str,
    end_marker: str,
    content: str,
) -> bool:
    """
    Replace content between markers in a file.

    Returns True if file was modified, False otherwise.
    """
    text = file.read_text()

    pattern = re.compile(
        rf"{re.escape(start_marker)}.*?{re.escape(end_marker)}",
        re.DOTALL,
    )

    if not pattern.search(text):
        raise ValueError(f"Markers not found in {file}")

    replacement = f"{start_marker}\n\n{content}\n\n{end_marker}"

    updated = pattern.sub(lambda _: replacement, text)

    if updated != text:
        _ = file.write_text(updated)
        return True

    return False


def sync_install_and_readme():

    FILE = Path("./README.md")
    START = "<!-- BEGIN CLI HELP -->"
    END = "<!-- END CLI HELP -->"
    COMMAND = ["./install", "--help"]

    try:
        help_text = run_command(COMMAND)
    except subprocess.CalledProcessError as e:
        raise SystemExit(f"Command failed: {e}") from e

    block = f"```text\n{help_text}\n```"

    if inject_between_markers(FILE, START, END, block):
        print(f"Updated CLI help in {str(FILE)}")


def sync_helpers_and_install():
    FILE = Path("./install")
    START = "### BEGIN HELPERS ###"
    END = "### END HELPERS ###"

    block = extract_shell_script_contents(Path("./_helpers/core"))

    if inject_between_markers(FILE, START, END, block):
        print(f"Updated CLI help in {str(FILE)}")


def main():
    parser = argparse.ArgumentParser(
        description="""
        Update generated content in files from commands or template sources.

        Arguments are in the form <source>-<target>, i.e. extract from <source> and inject into <target>.
        """,
    )

    _ = parser.add_argument(
        "task",
        type=str,
        choices=["install-readme", "helpers-install"],
        help="Which sync task to run",
    )

    args = parser.parse_args()

    if args.task == "install-readme":  # pyright: ignore[reportAny]
        sync_install_and_readme()
    elif args.task == "helpers-install":  # pyright: ignore[reportAny]
        sync_helpers_and_install()


if __name__ == "__main__":
    main()
