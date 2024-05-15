#!/usr/bin/env bash

projects_path=~/dev/games/

function godot_link_components { # $1: project name
  ln -s $projects_path/global/components "$projects_path/$1/components"
}

function godot_link_addon { # 1: project name # 2: addon name
  if [ ! -d "$projects_path/$1/addons" ]; then
      mkdir "$projects_path/$1/addons"
  fi
  ln -s "$projects_path/global/addons/$2" "$projects_path/$1/addons/$2"
}

function godot_link_addons { # $1: project name
  for d in "$projects_path"/global/addons/* ; do
      addon_name=$(basename "$d")
      godot_link_addon "$1" "$addon_name"
  done
}

function godot_link_theme() { # $1: project name
    mkdir -projects_path "$projects_path/$1/themes"
    ln -s "$projects_path/global/themes/godot-minimal-theme" "$projects_path/$1/themes/godot-minimal-theme"
}

function godot_new_project_from_template {
  local template_name="${1:-Base}"
  local project_name="${2:-$(uuidgen | cut -c-8)}"
  cp -mkdir "$projects_path/global/templates/$template_name" "$projects_path/$project_name"
  godot_link_components "$project_name"
  godot_link_addon "$project_name"
  godot_link_theme "$project_name"
  xdg-open "$projects_path/$project_name/project.godot"
}