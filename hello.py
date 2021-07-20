"""Print a message to the terminal."""
import fire


def get_message():
    return "I ♡ templates"


def main(n_times=2):
    message = get_message()
    for _ in range(n_times):
        print(message)


if __name__ == "__main__":
    # Fire will pass on any commandline args to main()
    fire.Fire(main)  # pragma: no cover
