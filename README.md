# Perch Website Starter

Used to create new projects using the [Perch CMS](https://grabaperch.com/) at XM Media.

## Setting Up a New Site

1. Download a copy of this repo (probably as a ZIP).
2. [Download Perch](https://grabaperch.com/account) and merge the existing perch dir with the downloaded on.
3. Find and make changes near `@todo-perch` comments throughout the site. Especially important to do the one in `.gitignore` otherwise the private config may be committed to the repo.
4. Make dev redirect change in `.htaccess` (search for `@todo`)
5. Run `npm install`
6. Run Perch setup at: `/perch/setup`
7. Delete the `/perch/setup` folder.
8. Set the appropriate permissions on `/perch/resources` (if needed).
