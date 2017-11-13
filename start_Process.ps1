get-childitem env:\*docker* | Remove-Item
docker-compose build ; docker-compose up -d