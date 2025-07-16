# Bash Script Init Container

A minimal Alpine-based container for running Bash scripts with common tools. Use as an init container or fork to customize for your own scripting needs.

## Usage

**Docker:**
```sh
docker run --rm -it ghcr.io/<your-org>/<your-repo>:latest 'echo Hello World'
```

**Kubernetes initContainer:**
```yaml
initContainers:
  - name: wait-for-db
    image: ghcr.io/<your-org>/<your-repo>:latest
    command:
      - |
        until nc -z db 5432; do
          echo "Waiting for database...";
          sleep 2;
        done
```

**ECS Task Definition:**
```json
{
  "containerDefinitions": [
    {
      "name": "wait-for-db",
      "image": "ghcr.io/<your-org>/<your-repo>:latest",
      "command": [
        "until nc -z db 5432; do echo 'Waiting for database...'; sleep 2; done"
      ]
    }
  ]
}
```

## Customization

- Change default tools by building with:
  `docker build --build-arg PACKAGES="curl wget jq aws-cli git" -t my-init-container .`
- Fork this repo to add scripts, tools, or CI steps.

## Included Tools

- bash, curl, wget, jq, aws-cli (customizable)

## Security

- Automated vulnerability scans (Trivy)
- SBOM and provenance attestation for each build
- Minimal permissions and regular cache invalidation

**Important Notice:** This image runs as root. It is recommended to run it with a read-only filesystem and writable volume mounts.


## License

MIT

Maintainer: [tionichm](https://github.com/tionichm)
