#!/bin/bash
repoUrl=git@github.com:sidhantpanda/docker-express-typescript-boilerplate.git

read -p "Enter project name [express-typescript-boilerplate]: "  project_name
if [ "$project_name" == "" ];  then
    project_name="express-typescript-boilerplate"
fi
echo -e "Generating project $project_name\n\n"

git clone $repoUrl $project_name
cd $project_name
rm -rf .git
git init
echo -e "\n\nGenerated TypeScript Express server at $project_name"
echo -e "Installing dependencies \n\n"
npm i
