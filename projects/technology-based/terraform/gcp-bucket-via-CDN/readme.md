# Access GCP Bucket via CDN

To serve objects from a Google Cloud Storage bucket through Google Cloud CDN, you need to follow these general steps. Keep in mind that specific details may vary based on your requirements and the configuration you choose:

1. **Enable Google Cloud CDN:**
   - Open the Google Cloud Console: https://console.cloud.google.com/
   - Navigate to the "Navigation menu" and select "CDN" under "Networking."

2. **Create a Backend Service:**
   - In the CDN section, create a backend service that points to your Cloud Storage bucket. This backend service defines the origin from which CDN fetches content.
   - Specify your Cloud Storage bucket as the backend bucket.

3. **Create a Cache Key Policy (Optional):**
   - Define a cache key policy to control how the CDN caches and serves content.

4. **Create a Frontend Configuration:**
   - Configure the frontend settings, including the IP address and ports, and specify the backend service you created.

5. **Configure the Cloud Storage Bucket:**
   - Make sure that your Cloud Storage bucket is configured to allow public access or has the necessary permissions for Google Cloud CDN to fetch the content.

6. **Wait for Deployment:**
   - It might take some time for the CDN to deploy the configuration globally. Monitor the deployment status in the Google Cloud Console.

7. **Access Content via CDN:**
   - Once the CDN is deployed, you can access your objects via the CDN-enabled URL. The URL is typically in the format: `https://<cdn-enabled-domain>/<path-to-object>`. The `<cdn-enabled-domain>` is provided when you configure the frontend settings.

For a more detailed and accurate step-by-step guide, please refer the following resource:
- [Setup a Backend Bucket](https://cloud.google.com/cdn/docs/setting-up-cdn-with-bucket)