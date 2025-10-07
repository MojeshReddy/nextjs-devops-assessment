# Stage 1 - build
FROM node:18-alpine AS builder
WORKDIR /app
RUN apk add --no-cache python3 make g++ bash
COPY package.json package-lock.json* ./
RUN npm ci --silent
COPY . .
RUN npm run build

# Stage 2 - runtime
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
RUN addgroup -S nextgroup && adduser -S nextuser -G nextgroup
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/pages ./pages
COPY --from=builder /app/next.config.js ./next.config.js
EXPOSE 3000
USER nextuser
CMD ["npm", "run", "start"]


