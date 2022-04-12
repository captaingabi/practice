# shellcheck disable=SC2148
# Common build options and variables

cleanup() {
    rm -rf "${TMP_DIR:-}"
}
trap cleanup EXIT

generate_dockerfile()
{
    local base="$1"
    sed "s#%IMAGE_TAG%#${base}#" "${BUILD_DIR}"/Dockerfile.template > "${TMP_DIR}"/Dockerfile
}

docker_image_pull()
{
    local img="${1:-}"
    local sha="${2:-}"

    docker pull "${img}" 1>&2

    imgsha=$(docker image inspect --format='{{.Id}}' "${img}" 2>/dev/null)

    if [ "${imgsha}" = "${sha}" ]; then
        return 0
    else
        cat <<EOF >&2
FAIL: docker image pull, [${img}] SHA mismatch!
EOF
        return 1
    fi
}

docker_image_tag()
{
    local old="${1:-}"
    local new="${2:-}"

    docker tag "${old}" "${new}" 1>&2
    docker rmi "${old}"
}
