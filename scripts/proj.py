from PyInquirer import style_from_dict, Token, prompt, Separator
import os


def get_project_dirs(base_dir):
    directories = []
    for directory in os.listdir(base_dir):
        tmux = os.path.join(base_dir, directory) + "/.tmuxinator.yml"
        if os.path.isfile(tmux):
            directories.append(directory)

    return directories


def start_tmux(directory):
    os.system("cd {} && tmuxinator".format(directory)) 

questions = [
    {
        'type': 'list',
        'name': 'project',
        'message': 'Select project:',
        'choices': get_project_dirs("/home/christophermedlin/projects"),
    },
]

if __name__ == "__main__":
    answers = prompt(questions)
    start_tmux("~/projects/" + answers["project"])
