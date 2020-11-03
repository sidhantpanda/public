#!/bin/bash
repoUrl=git@github.com:sidhantpanda/docker-express-typescript-boilerplate.git

read -p "Enter project name [docker-express-typescript-boilerplate]: "  project_name
if [ "$project_name" == "" ];  then
    project_name="docker-express-typescript-boilerplate"
fi
echo -e "Generating project $project_name\n\n"

git clone $repoUrl $project_name
cd $project_name
rm -rf .git
git init
echo -e "\n\nGenerated TypeScript Express server at $project_name"
echo -e "Installing dependencies \n\n"
npm i
read -p "Configure Github Actions? [Y/n]: "  configureOption
if [ "$configureOption" == "Y" ] || [ "$configureOption" == "y" ];  then
    npm run setup-actions
else
    echo "Skipping configuring Github Actions."
    echo "Please update the file at ./github/latest.yml to set the correct Docker Repo."
    echo "Or run npm run setup-actions later."
fi