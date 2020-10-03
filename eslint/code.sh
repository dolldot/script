#!/bin/bash
npm install -D eslint prettier
npx install-peerdeps --dev eslint-config-airbnb
npm install -D eslint-config-prettier eslint-plugin-prettier
touch .eslintrc.json .prettierrc
cp ~/Mine/.eslintrc.json .eslintrc.json
cp ~/Mine/.prettierrc .prettierrc
