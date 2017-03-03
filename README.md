# Perch Website Starter

Used to create new projects using the [Perch CMS](https://grabaperch.com/) at XM Media.

## Setting Up a New Site

1. Download a copy of this repo (probably as a ZIP).
2. Remove or update the `LICENSE` file.
3. [Download Perch](https://grabaperch.com/account) and merge the existing perch dir with the downloaded one.
4. Find and make changes near `@todo-perch` comments throughout the site. Especially important to do the one in `.gitignore` otherwise the private config may be committed to the repo!
5. Make dev redirect change in `.htaccess` (search for `@todo`)
6. Run `. ./node_setup.sh` to configure node & webpack.
7. Run `yarn` to install node packages.
8. Run `webpack` or `webpack --watch` to compile JS & CSS files. (When going live, run `npm run build` instead.)
9. Run Perch setup at: `/perch/setup`
10. Delete the `/perch/setup` folder.
11. Set the appropriate permissions on `/perch/resources` (if needed).
