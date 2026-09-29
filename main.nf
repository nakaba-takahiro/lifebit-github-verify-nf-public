#!/usr/bin/env nextflow
nextflow.enable.dsl = 2

params.outdir = 'results'

process VERIFY {
    publishDir params.outdir, mode: 'copy'

    output:
    path 'version.txt'

    script:
    """
    echo "VERSION=public-v1" | tee version.txt
    echo "HOST=\$(hostname)" | tee -a version.txt
    """
}

workflow {
    VERIFY()
}
