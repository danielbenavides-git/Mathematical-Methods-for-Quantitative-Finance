import os
import urllib.parse

# -----------------------
# CONFIG
# -----------------------

GITHUB_USERNAME = "danielbenavides-git"
REPO_NAME = "Mathematical-Methods-for-Quantitative-Finance"
BRANCH = "main"
README_FILE = "README.md"

START_MARKER = "<!-- AUTO-GENERATED: START -->"
END_MARKER = "<!-- AUTO-GENERATED: END -->"


def nbviewer_url(path):
    encoded_path = urllib.parse.quote(path)
    return (
        f"https://nbviewer.org/github/"
        f"{GITHUB_USERNAME}/{REPO_NAME}/blob/{BRANCH}/{encoded_path}"
    )


def find_modules():
    modules = []
    for item in sorted(os.listdir(".")):
        if os.path.isdir(item) and item.lower().startswith("module"):
            modules.append(item)
    return modules


def build_section():
    lines = []
    modules = find_modules()

    for module in modules:
        lines.append(f"### {module}")
        pdfs = sorted(f for f in os.listdir(module) if f.lower().endswith(".pdf"))

        if not pdfs:
            lines.append("- _(No PDFs yet)_")
            lines.append("")
            continue

        for pdf in pdfs:
            label = pdf.replace(".pdf", "").replace("-", " ").title()
            path = f"{module}/{pdf}"
            url = nbviewer_url(path)
            lines.append(f"- {label} | [PDF]({url})")

        lines.append("")

    return "\n".join(lines).strip()


def update_readme():
    with open(README_FILE, "r", encoding="utf-8") as f:
        content = f.read()

    if START_MARKER not in content or END_MARKER not in content:
        raise RuntimeError("AUTO-GENERATED markers not found in README.md")

    before, rest = content.split(START_MARKER, 1)
    _, after = rest.split(END_MARKER, 1)

    generated = build_section()

    new_content = (
        before
        + START_MARKER
        + "\n\n"
        + generated
        + "\n\n"
        + END_MARKER
        + after
    )

    with open(README_FILE, "w", encoding="utf-8") as f:
        f.write(new_content)


if __name__ == "__main__":
    update_readme()
    print("README.md updated successfully.")