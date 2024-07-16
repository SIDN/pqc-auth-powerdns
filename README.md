# PowerDNS authoritative nameserver with PQC algorithms

This repository contains the scripts to build PowerDNS authoritative DNS server with support for quantum-safe algorithms.
More information can be found in [our blog post](https://www.sidnlabs.nl/en/news-and-blogs/set-up-your-own-pqc-testbed-for-dnssec-with-the-patad-open-source-software).

Currently, we support Falcon512, SQIsign1 and Mayo2.

> [!CAUTION]
> This software is experimental and not meant to be used in production. Use this software at your own risk.

## Building the image

To build the image, run this (simplified) command:

	podman build -f Dockerfile --tag=auth-powerdns:latest

The tag is an example, just make sure you can find the image again for running the image as container.

## Example 

A minimal working example of running the image is included in the directory example.
It should how to build a container running example.nl, signed with SQIsign.
You can build it as follows:

	podman build -f example/Dockerfile --tag=patad-test-example.nl
	podman run --rm -d -p 5300:53/udp -p 5300:53/tcp patad-test-example.nl
	
And you can confirm it works:

	dig example.nl ns -p 5300 @localhost 

Note that PowerDNS signs on-the-fly, so the first query may take a while, since SQIsign is relatively slow in signing time.

For further examples, please refer to our [testbed repository for an example](https://github.com/SIDN/pqc-testbed).


## Updating patch PowerDNS

Browse to [SIDN Labs PowerDNS](https://github.com/SIDN/pdns) repository.
Then, for example:
    
    git checkout falcon-sqisign-20240315
    git diff auth-4.8.3 > /tmp/patch-4.8.3.diff

Then, move the patch file to the correct directory.

