URL="http://localhost:80"
STATUS_CODE=$(curl --write-out %{http_code} --silent --output /dev/null $URL)
if [ "$STATUS_CODE" -ne 200 ]; then
  echo "Health check failed. Application is not responding correctly."
  exit 1
else
  echo "Health check passed. Application is responding correctly."
fi
