# Q1

## Question
請以任意語言/形式撰寫一段腳本，找出“words.txt” 檔案內容中重複次數最多的單字 （大小寫將忽略不計。舉例來說：the/The 將會被視為相同單字）

## Answer

### Shell Script

```shell
cat words.txt | tr '[:upper:]' '[:lower:]' | tr -s '[:space:][:punct:]' '\n' | sort | uniq -c | sort -nr | head -n 1
```

### 說明
- tr '[:upper:]' '[:lower:]' 將所有字母轉為小寫，忽略大小寫差異
- tr -s '[:space:][:punct:]' '\n' 轉換空白與標點符號為換行，使單字逐行顯示
- sort 排序相同的單字，以便計數
- uniq -c 計算每個單字的出現次數
- sort -nr 依照次數遞減排序
- head -n 1 取出出現最多次的單字