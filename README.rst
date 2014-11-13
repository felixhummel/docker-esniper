Esniper in Docker
=================
Status: quick and dirty; works for me

See http://esniper.sourceforge.net/

Build the image::

    make build

Create a working directory and edit your configs::

    mkdir wd/
    cp sample_config.txt wd/config
    vim wd/config
    cp sample_auction.txt wd/foo
    vim wd/foo

Run esniper in there::

	docker run --name esniper-foo -d -v $(cd wd/ && pwd):/mnt esniper esniper -c config foo

Watch it::

    docker logs --follow esniper-foo

Clean up::

    docker rm --force esniper-foo

