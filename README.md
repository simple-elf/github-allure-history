# github-allure-history
Example project using GitHub Actions for Allure report with history on GitHub Pages

You can see [Allure Report](https://simple-elf.github.io/github-allure-history/) on GitHub Pages

## GitHub Actions
Learn how to use GitHub Actions on [official docs](https://docs.github.com/en/actions)

Here is my advices:
1. You need to enable actions in '/settings/actions', choosing 'Enable local and third party Actions for this repository'
2. Create a workflow '*.yml' file in '.gradle/workflows' directory. Example workflow [allure-history.yml](https://github.com/simple-elf/github-allure-history/blob/master/.github/workflows/allure-history.yml)
3. This workflow uses some GitHub Actions, especially 'allure-report-action'. You can see more about this action on [Marketplace](https://github.com/marketplace/actions/allure-report-with-history)

## GitHub Pages
Learn how to use GitHub Pages on [official docs](https://docs.github.com/en/github/working-with-github-pages)

Here is my advices:
1. Go to your repository '/settings', scroll down to 'GitHub Pages' section
2. By default, 'Source' is set to 'None'
3. Set it to 'gh-pages' branch and '/root' folder
4. If you don't have 'gh-pages' branch - you can't set it. You need to run workflow even once, and then you have this branch.
5. After changing settings you can see URL link in 'GitHub Pages' section like this 'Your site is published at ...'
6. Copy this link to repository details (in 'About' section on repo main page) in WebSite field

## Allure Report with history on GitHub Pages
Here is how this works:

1. Step 'Get Allure history' in workflow gets previous 'gh-pages' branch state (there is no error if it doesn't exist yet)
2. Step 'Allure Report action':
    1. Creates temp folder 'allure-history' with a copy of all 'gh-pages' branch files (previous reports)
    2. Get folder 'last-history' from 'gh-pages' branch to 'allure-results' of current build
    3. Generate report with Allure Commandline
    4. Get 'history' folder of current Allure Report to 'last-history' folder for the next build
    5. Copy current Allure Report to folder with current build number
    6. Creates 'index.html' file in root of 'allure-history', that will be redirecting to folder with current build number
3. Step 'Deploy report to Github Pages' do 'git push' of 'allure-history' folder to 'gh-pages' branch
4. And then just magic of GitHub Pages deploy happens, you can open root link of GitHub Pages and always see redirect to the last Allure Report