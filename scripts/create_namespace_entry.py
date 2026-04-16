import argparse
import os
from pathlib import Path
from typing import Iterable


DOCSTRING = """
## Automatically generated.
""".strip()


def main() -> None:
	args = _parse_args()

	all_scripts: list[Path] = []

	all_scripts += _load_existing_scripts_and_names(args.script)
	all_scripts += _load_scripts_in_folders(args.script_folder)
	all_scripts += _load_scripts_in_folders(args.script_folder_recursive, True)

	all_scripts = sorted(list(set(all_scripts)))

	create_namespace_entry(args.output, all_scripts)


def _parse_args() -> argparse.Namespace:
	parser = argparse.ArgumentParser()

	parser.add_argument(
		"output", 
		type=Path, help="Where to create the output file."
	)

	parser.add_argument(
		"--script",
		action="append",
		type=Path
	)

	parser.add_argument(
		"--script-folder",
		type=Path,
		action="append",
		help="Folder to search for .gd scripts in."
	)

	parser.add_argument(
		"--script-folder-recursive",
		type=Path,
		action="append",
		help="Folder to recursively search for .gd scripts in."
	)

	args = parser.parse_args()

	if args.script is None: args.script = []
	if args.script_folder is None: args.script_folder = []
	if args.script_folder_recursive is None: args.script_folder_recursive = []

	return args


def _load_existing_scripts_and_names(scripts: list[Path]) -> Iterable[Path]:
	for script in scripts:
		if script.exists():
			yield script


def _load_scripts_in_folders(folders: list[Path], recursive: bool = False, print_errors: bool = True) -> Iterable[Path]:
	for folder in folders:
		yield from _load_scripts_and_names_in_folder(folder, recursive, print_errors)


def _load_scripts_and_names_in_folder(folder: Path, recursive: bool = False, print_errors: bool = True) -> list[Path]:
	if not folder.exists():
		print(f"{folder} folder does not exist! Skipping")
		return []
	if recursive:
		return list(folder.rglob("*.gd"))
	else:
		return list(folder.glob("*.gd"))


def create_namespace_entry(output: Path, scripts_to_expose: list[Path]) -> None:
	contents = _create_file_contents(output, scripts_to_expose)
	with open(output, "w") as file:
		file.write(contents)


def _create_file_contents(output: Path, scripts_to_expose: list[Path]) -> str:
	class_name = snake_to_pascal(output.stem)
	lines = [
		f"class_name {class_name}",
		DOCSTRING,
		""
	]

	for script in scripts_to_expose:
		lines.append(f"const {snake_to_pascal(script.stem)} := preload(\"{_get_preload_path(output, script)}\")")

	return "\n".join(lines)


def _get_preload_path(output_path: Path, script_path: Path) -> str:
	output_folder = output_path.parent
	script_folder = script_path.parent
	relative_folder_path = Path(os.path.relpath(script_folder, output_folder))
	return "./" + str(relative_folder_path / script_path.name).replace("\\", "/")


def snake_to_pascal(s: str) -> str:
	return ''.join(p.capitalize() for p in s.split('_'))


if __name__ == "__main__":
	main()
