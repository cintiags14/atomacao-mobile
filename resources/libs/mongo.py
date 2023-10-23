from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://cgalvaogs:qax@cluster0.9udlhzb.mongodb.net/MarkX?retryWrites=true&w=majority')

db = client['MarkX']

@keyword('Remove_task_from_database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa' + task_name)