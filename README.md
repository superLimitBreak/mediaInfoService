mediaInfoService
================

A [falcon](https://falconframework.org/) web app to return media metadata as json


Output Examples
---------------

`http://localhost:8331/`
```json
    [
        "LICENSE",
        "mediaInfoService.py",
        "Dockerfile",
        "Makefile",
        "mediaInfoService_test.py",
        "_env",
        "README.md",
        ".gitignore",
        ".git",
        "mediaInfoService_test.png",
        "mediaInfoService.pip"
    ]
```

`http://localhost:8331/mediaInfoService_test.png`
```json
    {
        "width": 16,
        "height": 16,
        "bits_per_pixel": 24,
        "pixel_format": "RGB",
        "compr_rate": 20.210526315789473,
        "creation_date": "2019-05-23T17:18:00",
        "compression": "deflate",
        "comment": "Created with GIMP",
        "mime_type": "image/png",
        "endian": "Big endian"
    }
```


Use
---

### Local

```
    make run
    curl "http://localhost:8331/mediaInfoService_test.png"
    make clean
```

### Docker

```bash
    make build
    make push
```
