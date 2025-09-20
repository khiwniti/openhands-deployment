
# OpenHands Deployment with copilot-api

This repository provides a setup for deploying OpenHands with the copilot-api, configured for easy deployment to Render.com.

## Render Deployment

This repository includes a `render.yaml` file for easy deployment to Render.com. 

For continuous deployment using GitHub Actions, ensure you have the following GitHub Secrets configured in your repository:

- `RENDER_SERVICE_ID`: The ID of your Render service.
- `RENDER_API_KEY`: Your Render API key.

The GitHub Actions workflow (`.github/workflows/render-deploy.yml`) will automatically deploy changes to Render on every push to the `master` branch.


