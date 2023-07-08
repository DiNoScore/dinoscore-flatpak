build:
    flatpak-builder --user builder de.piegames.dinoscore.yml --force-clean --sandbox

update:
    # Pin cargo dependencies
    python generator.py -o cargo-sources.json # TODO fix

    # Flatpak doesn't do any dependency sharing, and instead we are expected to copy-paste some other application's dependencies
    # and manually maintain them.
    # So we do the only sensible thing, and automate that part by jq-ing the relevant snippet from the other application
    yq -y '.modules | .[] | objects | select(.name == "pikepdf-src") | .modules[0] = "com.github.jeromerobert.pdfarranger/" + .modules[0] | .modules[1] = "com.github.jeromerobert.pdfarranger/" + .modules[1]' com.github.jeromerobert.pdfarranger/com.github.jeromerobert.pdfarranger.yaml > pikepdf.yml
