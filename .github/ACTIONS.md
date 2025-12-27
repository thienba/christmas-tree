# GitHub Actions Setup Guide

This project includes automated build and deployment workflows using GitHub Actions.

## 🚀 Available Workflows

### 1. **CI Workflow** (`ci.yml`)
- **Triggers:** On every push to feature branches and PRs
- **Purpose:** Lint code and test builds
- **Actions:**
  - Runs ESLint
  - Tests the build process
  - Uploads build artifacts for review

### 2. **Deploy Workflow** (`deploy.yml`)
- **Triggers:** On push to `main`/`master` branch, or manual trigger
- **Purpose:** Build and deploy to various platforms
- **Supported Platforms:**
  - GitHub Pages (disabled by default)
  - Vercel (disabled by default)
  - Netlify (disabled by default)

---

## 📦 Setup Instructions

### Basic Setup (Build Only)

No additional configuration needed! The workflow will:
1. ✅ Build your project on every push to main
2. ✅ Upload build artifacts (available for 7 days)
3. ✅ Lint code on feature branches

### Enable GitHub Pages Deployment

1. **Configure Repository Settings:**
   ```
   Settings → Pages → Source → GitHub Actions
   ```

2. **Update `.github/workflows/deploy.yml`:**
   ```yaml
   deploy-github-pages:
     if: false # Change this to true
   ```

3. **Update `vite.config.ts` base path:**
   ```typescript
   base: '/your-repo-name/', // Change from '/'
   ```

4. **Push changes:**
   ```bash
   git add .
   git commit -m "Enable GitHub Pages"
   git push
   ```

5. **Access your site:**
   ```
   https://your-username.github.io/your-repo-name/
   ```

### Enable Vercel Deployment

1. **Get Vercel credentials:**
   - Install Vercel CLI: `npm i -g vercel`
   - Run: `vercel login`
   - Run: `vercel link` in your project
   - Get tokens from: https://vercel.com/account/tokens

2. **Add GitHub Secrets:**
   ```
   Repository → Settings → Secrets and variables → Actions → New secret
   ```
   
   Add these secrets:
   - `VERCEL_TOKEN` - Your Vercel token
   - `VERCEL_ORG_ID` - From `.vercel/project.json`
   - `VERCEL_PROJECT_ID` - From `.vercel/project.json`

3. **Enable in workflow:**
   ```yaml
   deploy-vercel:
     if: false # Change to true
   ```

### Enable Netlify Deployment

1. **Get Netlify credentials:**
   - Go to: https://app.netlify.com/user/applications
   - Create a Personal Access Token
   - Get Site ID from: Site Settings → General → Site details

2. **Add GitHub Secrets:**
   - `NETLIFY_AUTH_TOKEN` - Your personal access token
   - `NETLIFY_SITE_ID` - Your site ID

3. **Enable in workflow:**
   ```yaml
   deploy-netlify:
     if: false # Change to true
   ```

---

## 🔐 Environment Variables (Optional)

For cloud photo sharing features, add these secrets:

```
Repository → Settings → Secrets and variables → Actions
```

Add the following secrets:
- `CLOUDFLARE_ACCOUNT_ID`
- `CLOUDFLARE_R2_ACCESS_KEY_ID`
- `CLOUDFLARE_R2_SECRET_ACCESS_KEY`
- `CLOUDFLARE_KV_NAMESPACE_ID`
- `CLOUDFLARE_KV_API_TOKEN`
- `R2_PUBLIC_URL`

These are automatically injected during the build process.

---

## 🎯 Workflow Triggers

### Automatic Triggers
- **Push to main/master** → Full build and deploy
- **Push to other branches** → CI only (lint + build test)
- **Pull Request** → CI checks

### Manual Triggers
1. Go to: `Actions` tab
2. Select `Build and Deploy`
3. Click `Run workflow`
4. Choose branch and run

---

## 📊 Monitoring Builds

### View Build Status
- Go to `Actions` tab in your repository
- Click on any workflow run to see details
- Download build artifacts if needed

### Build Badges
Add to your `README.md`:

```markdown
![Build Status](https://github.com/username/repo/workflows/Build%20and%20Deploy/badge.svg)
```

---

## 🛠️ Customization

### Change Node Version
Edit both workflow files:
```yaml
- name: Setup Node.js
  uses: actions/setup-node@v4
  with:
    node-version: '20' # Change to 18, 20, 21, etc.
```

### Add Custom Build Steps
In `deploy.yml`, add after build:
```yaml
- name: Custom build step
  run: |
    echo "Running custom commands..."
    # Your commands here
```

### Deploy to Multiple Platforms
Set multiple `if: true` in deploy.yml:
```yaml
deploy-github-pages:
  if: true # Enable
  
deploy-vercel:
  if: true # Enable
```

---

## 📝 Common Issues

### Build Fails: "Cannot find module"
- Make sure `package-lock.json` is committed
- Use `npm ci` instead of `npm install` locally

### GitHub Pages shows 404
- Check `base` path in `vite.config.ts`
- Must match your repository name

### Secrets not working
- Secret names are case-sensitive
- Secrets don't show in logs for security
- Test locally with `.env.local` first

---

## 🎄 Quick Start

**Minimal setup for automatic builds:**

1. Create GitHub repository
2. Push your code:
   ```bash
   git add .
   git commit -m "Add GitHub Actions"
   git push
   ```
3. Check `Actions` tab - builds run automatically!

That's it! Your Christmas tree builds on every push. 🎉

For deployments, follow the platform-specific setup above.

