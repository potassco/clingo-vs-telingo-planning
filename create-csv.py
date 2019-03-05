from __future__ import print_function
from getopt import getopt, error
from sys import argv, exit
from os import path, remove, listdir
from re import findall, sub, MULTILINE, finditer
from string import ascii_uppercase
import subprocess
import datetime

# Usage:
# python create-csv.py ./clingo-pmork-Base/
# python create-csv.py ./telingo-pmork-Base/

today = datetime.date.today()

runsolver_path = "/run1/runsolver.solver"
csv_file_path = "./" + today.strftime("%Y%m%d")
instances_path = argv[1]

if 'clingo' in instances_path:
    csv_file_path += "-clingo-results.csv"
else:
    csv_file_path += "-telingo-results.csv"

delimiter = ","

header = [
    "Instance",
    "Models",
    "Calls",
    "Time",
    "Solving Time",
    "Choices",

    "Conflicts",
    "Restarts",
    "Model-Level",
    "Problems",
    "Lemmas",

    "Binary",
    "Ternary",
    "Conflict",
    "Loop",
    "Other",

    "Backjumps",
    "Executed",
    "Bounded",
    "Rules",
    "Choice",

    "Atoms",
    "Bodies",
    "Count",
    "Equivalences",
    "Tight",

    "Variables",
    "Constraints"
]

stats_header=""
for head in header:
    stats_header += head

    if head != header[-1]:
        stats_header += delimiter
    else:
        stats_header += "\n"

stats = {
    "hanoi": [],
    "labyrinth": [],
    "nomystery": [],
    "ricochet": [],
    "sokoban": [],
    "visitall": [],
}

re_problem = r'(^[0-9]{3,4}-)(hanoi|labyrinth|nomystery|ricochet|sokoban|visitall)'

# Filter for stats (--stats option) 
regex_list = [
    r'(Models\s+:\s{1})([0-9a-zA-Z\.:\(\)=%]+)', # Models,
    r'(Calls\s+:\s{1})([0-9a-zA-Z\.:\(\)=%]+)', # Calls
    r'(\nTime\s+:\s{1})([0-9\.]+)s', # Time
    r'(Solving:\s{1})([0-9\.]+)s', # Solving Time
    r'(\nChoices\s+:\s{1})([0-9\.]+)', # Choices
    r'(\nConflicts\s+:\s{1})([0-9\.]+)', # Conflicts

    r'(\nRestarts\s+:\s{1})([0-9\.]+)', # Restarts
    r'(\nModel-Level\s+:\s{1})([0-9\.]+)', # Model-Level
    r'(\nProblems\s+:\s{1})([0-9\.]+)', # Problems
    r'(\nLemmas\s+:\s{1})([0-9\.]+)', # Lemmas
    r'(\n\s{2}Binary\s+:\s{1})([0-9\.]+)', # Binary
    
    r'(\n\s{2}Ternary\s+:\s{1})([0-9\.]+)', # Ternary
    r'(\n\s{2}Conflict\s+:\s{1})([0-9\.]+)', # Conflict
    r'(\n\s{2}Loop\s+:\s{1})([0-9\.]+)', # Loop
    r'(\n\s{2}Other\s+:\s{1})([0-9\.]+)', # Other
    r'(\nBackjumps\s+:\s{1})([0-9\.]+)', # Backjumps
    
    r'(\n\s{2}Executed\s+:\s{1})([0-9\.]+)', # Executed
    r'(\n\s{2}Bounded\s+:\s{1})([0-9\.]+)', # Bounded
    r'(\nRules\s+:\s{1})([0-9\.]+)', # Rules
    r'(\n\s{2}Choice\s+:\s{1})([0-9\.]+)', # Choice
    r'(\nAtoms\s+:\s{1})([0-9\.]+)', # Atoms
    
    r'(\nBodies\s+:\s{1})([0-9\.]+)', # Bodies
    r'(\n\s{2}Count\s+:\s{1})([0-9\.]+)', # Count
    r'(\nEquivalences\s+:\s{1})([0-9\.]+)', # Equivalences
    r'(\nTight\s+:\s{1})([0-9\.a-zA-Z]+)', # Tight
    r'(\nVariables\s+:\s{1})([0-9\.]+)', # Variables
    
    r'(\nConstraints\s+:\s{1})([0-9\.]+)' # Constraints
]

# go through all subdirs to read out stats from clingo/telingo
dir_list = listdir(instances_path)

for dir in dir_list:
    if dir[0] == ".":
        continue

    problem = findall(re_problem, dir)[0][1]
    stats_file_path = instances_path + dir + runsolver_path
    stats_file = open(stats_file_path, "r")
    stats_csv_line = dir[0:(len(dir)-4)] + delimiter

    if stats_file.mode == "r":
        stats_file_contents = stats_file.read()

        for regex in regex_list:
            res = findall(regex, stats_file_contents, flags=MULTILINE)

            if len(res) > 0:
                res = res[0][1]

                stats_csv_line += res
            else:
                stats_csv_line += "-"

            # add newline when needed
            if regex != regex_list[-1]:
                stats_csv_line += delimiter
            else:
                if dir != dir_list[-1]:
                    stats_csv_line += "\n"
        
        stats[problem].append(stats_csv_line)
    stats_file.close()

# write created csv lines to csv file
csv_file = open(csv_file_path, "w+")
csv_file.write(stats_header)
for problem in sorted(stats):
    stats[problem].sort()
    for stat in sorted(stats[problem]):
        csv_file.write(stat)

csv_file.close()

print("Created file: %s" % csv_file_path)