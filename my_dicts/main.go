package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
	"time"
)

type config struct {
	path  string
	wight int
}

const head = `# Rime dictionary
# encoding: utf-8
#
# 通过多个文件进行合并产生
#
---
name: "cn_merge"
version: "%s"
sort: by_weight
columns:
  - text
  - weight
...
# +_+

`

const line = "%s\t%d\n"

var conf = []config{
	{"manga.txt",200},
	{"special/dicts/cn_name.txt", 300},
	{"special/dicts/cn_tags.txt", 100},
	{"special/dicts/cn_notes.txt", 100},
}

func main() {

	dict := make(map[string]int)
	for _, c := range conf {
		words, err := readDict(c.path)
		if err != nil {
			continue
		}
		for _, w := range words {
			dict[w] = max(dict[w], c.wight)
		}
	}
	// sort
	// Extract the keys from the map
	keys := make([]string, 0, len(dict))
	for k := range dict {
		keys = append(keys, k)
	}

	// Sort the keys
	sort.Strings(keys)
	// output
	fmt.Printf(head, time.Now().Format(time.DateOnly))
	for _, k := range keys {
		fmt.Printf(line, k, dict[k])
	}

}

func readDict(path string) ([]string, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		dict := scanner.Text()
		dict = strings.TrimSpace(dict)
		if strings.Contains(dict, "#") {
			continue
		}
		if strings.Contains(dict, "\t") {
			dict = strings.Split(dict, "\t")[0]
		}
		if dict == "" {
			continue
		}
		lines = append(lines, dict)
	}

	if err := scanner.Err(); err != nil {
		return nil, err
	}

	return lines, nil
}
