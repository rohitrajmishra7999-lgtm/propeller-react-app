#!/bin/bash

# Step 1: Create react app using the create-react-app tool
npx create-react-app propeller-react-app
cd propeller-react-app

# Step 2: Commit the code, create GitHub repo using GitHub CLI
git add .
git commit -m "Initialize project using Create React App"
gh repo create propeller-react-app --public --source=. --remote=origin --push

# Step 3: Switch branch to "update_logo"
git checkout -b update_logo

# Step 4: Replace existing logo with Propeller Aero footer logo
curl -s -L "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# Step 5: Replace existing link with https://www.propelleraero.com/dirtmate/
sed -i 's|https://reactjs.org|https://www.propelleraero.com/dirtmate/|g' src/App.js

# Step 6: Commit, then push the code
git add .
git commit -m "Update logo and link"
git push -u origin update_logo

# Step 7: Create PR from "update_logo" to "master" branch using GitHub CLI
gh pr create --base master --head update_logo --title "Update logo and link" --body "Replace existing logo with Propeller Aero footer logo and update link to Propeller DirtMate"

# Step 8: Merge the PR using GitHub CLI
gh pr merge update_logo --merge
