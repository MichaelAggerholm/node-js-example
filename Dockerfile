# Brug et officielt Node base image
FROM node:14

# Sæt arbejdsdirectory i containeren
WORKDIR /usr/src/app

# Kopier package.json og package-lock.json
COPY package*.json ./

# Installer applikationsafhængigheder
RUN npm install

# Kopier applikationskoden til containeren
COPY . .

# Applikationen binder til port 3000, så du bør bruge denne port
EXPOSE 3000

# Kør applikationen, når containeren starter
CMD ["npm", "start"]