#!/usr/bin/env bash
set -euxo pipefail

if [ -z "${GCP_PROJECTS+x}" ] || [ -z "${GCP_CLUSTERS+x}" ] || [ -z "${GCP_REGION+x}" ]; then
    echo "skipping gcloud initialization"
else
    gcloud init --console-only

    for project in ${GCP_PROJECTS}; do
        for cluster in ${GCP_CLUSTERS}; do
            gcloud container clusters get-credentials "${cluster}" --project "${project}" --region "${GCP_REGION}"
        done
    done
fi
