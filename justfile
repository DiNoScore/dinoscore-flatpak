build:
    flatpak-builder builder de.piegames.dinoscore.yml --force-clean --sandbox

update:
    python generator.py -o cargo-sources.json # TODO fix
