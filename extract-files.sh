#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libSNPE.so|vendor/lib*/liblgdnnsnpe.so|vendor/lib*/liblgsnpeawb.so|vendor/lib*/liblgsnpeawb_beta.so|vendor/lib*/libtof_cal.so)
            ${PATCHELF_0_17_2} --replace-needed libstdc++.so libstdc++_vendor.so "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=alphalm
export DEVICE_COMMON=sm8150-common
export VENDOR=lge

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
