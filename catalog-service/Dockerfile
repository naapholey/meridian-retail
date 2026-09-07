#define the base image needed for the application
FROM node:20-alpine

#generate metadata for the image
LABEL maintainer="Antoinette <"annett@gmail.com">"
LABEL version="1.0.0"
LABEL description="Simple Node.js app for Docker demonstration"

#define environment variables for the application
ENV NODE_ENV=production
ENV PORT=3000

#set the working directory for the application innt he container
WORKDIR /app

#copy package.json and package-lock.json to the working directory
COPY package.json ./
COPY package-lock.json ./

#run npm ci to install dependencies in production mode 
RUN npm ci --only=production

#copy the rest of the application code to the working directory
COPY . .

#expose the port that the application will run on
EXPOSE 4000

#command to run the application
CMD ["node", "app.js"]
