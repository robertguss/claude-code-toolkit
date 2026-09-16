# Publish: the wiki as a site

Quartz builds the wiki folder into a static site; a GitHub Actions workflow
publishes it to GitHub Pages on every push to the default branch. Node 22 and
npm 10.9 or later on the machine (`mise use node@22` if not).

## Steps

1. Quartz into `site/` at the repo root, its own history removed:

   ```bash
   git clone --depth 1 https://github.com/jackyzha0/quartz.git site
   rm -rf site/.git
   cd site && npm ci
   ```

2. `assets/quartz.config.yaml` over `site/quartz.config.yaml`, with `pageTitle`
   set to the project's name and `baseUrl` to `<user>.github.io/<repo>`
   (`gh repo view --json nameWithOwner` gives both). The `ignorePatterns` list
   keeps `.obsidian` and `tools` out of the site; add any folder the human wants
   unpublished.

3. `npx quartz plugin install --from-config` in `site/`, then a local build to
   prove it: `npx quartz build -d ../<wiki> -o public`. The `public/` folder is
   in Quartz's own `.gitignore`.

4. `assets/publish-wiki.yml` to `.github/workflows/publish-wiki.yml`, with
   `<wiki>` replaced by the wiki folder's name.

5. Commit `site/` (minus `node_modules` and `public`, which its `.gitignore`
   already excludes) and the workflow by path, and push.

6. The one step only the human can do: in the repository's settings on GitHub,
   under Pages, set the source to **GitHub Actions**. Say this plainly in the
   report with the URL the site will have.

Done when the workflow's first run is green
(`gh run list --workflow publish-wiki.yml`) and the site answers at its URL.

## After

Every push to the default branch rebuilds the site. Nothing in the wiki changes
for publishing except frontmatter Quartz reads: `title:` is the page title, and
a page with `draft: true` is left out.
