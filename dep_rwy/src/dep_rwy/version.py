__version__ = "1.0.0-dev0"

def get_major_version() -> str:
    return __version__.rpartition('.')[0]
