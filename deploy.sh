#!/bin/bash

# Quick deployment script for GitHub
# This script helps you set up and deploy your project

echo "🎄 Christmas Tree - GitHub Deployment Helper"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Check if remote exists
if ! git remote get-url origin > /dev/null 2>&1; then
    echo ""
    echo "🔗 No git remote found."
    echo "Please enter your GitHub repository URL:"
    echo "Example: https://github.com/username/christmas-tree.git"
    read -p "Repository URL: " repo_url
    
    if [ ! -z "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ Remote added: $repo_url"
    fi
else
    echo "✅ Remote already configured: $(git remote get-url origin)"
fi

# Check if there are uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo ""
    echo "📝 Uncommitted changes detected. Would you like to commit them?"
    read -p "Commit message (or press Enter to skip): " commit_msg
    
    if [ ! -z "$commit_msg" ]; then
        git add .
        git commit -m "$commit_msg"
        echo "✅ Changes committed"
    else
        echo "⏭️  Skipping commit"
    fi
else
    echo "✅ No uncommitted changes"
fi

# Ask about pushing
echo ""
read -p "📤 Push to GitHub? (y/n): " push_confirm

if [ "$push_confirm" = "y" ] || [ "$push_confirm" = "Y" ]; then
    # Check if branch exists on remote
    current_branch=$(git branch --show-current)
    
    if git ls-remote --exit-code --heads origin "$current_branch" > /dev/null 2>&1; then
        git push
    else
        git push -u origin "$current_branch"
    fi
    
    echo ""
    echo "✅ Pushed to GitHub!"
    echo ""
    echo "🎯 Next steps:"
    echo "1. Go to your GitHub repository"
    echo "2. Click on 'Actions' tab"
    echo "3. Watch your build run automatically!"
    echo ""
    echo "📚 For deployment setup, see: .github/ACTIONS.md"
else
    echo "⏭️  Skipping push"
fi

echo ""
echo "🎄 Done! Happy Holidays! ✨"

