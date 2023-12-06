# Use the latest version of Node.js
#
# You may prefer the full image:
# FROM node
#
# or even an alpine image (a smaller, faster, less-feature-complete image):
# FROM node:alpine
#
# You can specify a version:
# FROM node:10-slim
FROM node:16-slim

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="Are They Awake Yet?"
LABEL "com.github.actions.description"="Ask if a user is awake and find out what the time is in the location they specify in their profile."
# Here are all of the available icons: https://feathericons.com/
LABEL "com.github.actions.icon"="clock"
# And all of the available colors: https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#label
LABEL "com.github.actions.color"="gray-dark"

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of your action's code
COPY . .

# Run `node /index.js`
ENTRYPOINT ["node", "/index.js"]
