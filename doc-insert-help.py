#!/usr/bin/env python3

import re
import subprocess
import sys
from pathlib import Path

FILE = Path("README.md")
START = "<!-- BEGIN CLI HELP -->"
END = "<!-- END CLI HELP -->"
COMMAND = ["./install", "--help"]


def main():
    try:
        result = subprocess.run(
            COMMAND,
            capture_output=True,
            text=True,
            check=True,
        )
    except subprocess.CalledProcessError as e:
        print("Failed to run command:", e, file=sys.stderr)
        sys.exit(1)

    help_text = result.stdout.strip()

    content = FILE.read_text()

    pattern = re.compile(
        rf"{re.escape(START)}.*?{re.escape(END)}",
        re.DOTALL,
    )

    if not pattern.search(content):
        print("Markers not found in README.md", file=sys.stderr)
        sys.exit(1)

    replacement = f"{START}\n\n```text\n{help_text}\n```\n\n{END}"

    updated = pattern.sub(replacement, content)

    if updated != content:
        _ = FILE.write_text(updated)
        print("Updated CLI help in README.md")


if __name__ == "__main__":
    main()
