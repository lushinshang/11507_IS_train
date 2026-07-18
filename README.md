# 11507_IS_train｜中小企業基礎資安培訓課程整理專案

本專案用於整理「115 年中小企業基礎資安培訓課程」的課程逐字稿、繁體中文深度導讀、出版級 HTML、每日課程目錄與版面檢查成果。

目前已完成「第二期 Day1」的四堂課程導讀與整合首頁。

## 專案根目錄結構

```text
11507_IS_train/
├── README.md          本說明文件
├── index.html          兩天課程的總入口（見下方「多期別總入口」）
├── Day1/               第二期 Day1 課程產出（已完成，見下方「目錄與檔案用途」）
├── Day2/               第二期 Day2 課程產出（製作中，目前為空目錄，製作方式見「Day2 製作 SOP」）
└── _tooling/           非課程內容的工具產出，與課程資料分開放，方便瀏覽專案時聚焦內容
    ├── playwright-mcp/     Playwright 測試工具的 log 與頁面快照（開發過程留存，非交付物）
    └── qa/                 根目錄 index.html 的 RWD 驗證截圖（qa_root_index_desktop.png、qa_root_index_mobile.png）
```

`_tooling/` 內容屬於開發過程的輔助證據，不是課程內容本身；依保存鐵律一樣不刪除，但整理收納時會持續歸位到這裡，讓根目錄保持以課程資料為主。

## 多期別總入口

根目錄 `index.html` 是 Day1、Day2 兩天課程的總覽首頁：

- **Day1 卡片**：可點擊，連到 `Day1/index.html`。
- **Day2 卡片**：目前標示「製作中／尚未開通」，沒有可點擊連結（因為 `Day2/index.html` 還不存在）。Day2 製作完成後，記得把這張卡片改成可點擊的 `<a href="Day2/index.html">` 連結。

## 最高優先維護規則

> **本專案只可以新增或修改，不可以刪除。**

此規則適用於專案內所有目錄、原始資料、Markdown、HTML、腳本、樣式、圖片、QA 截圖及後續新增的任何檔案。

維護時必須遵守：

1. 可以新增新的課程、文件、版本、樣式、腳本與檢查成果。
2. 可以修改既有內容，以補充資料、修正錯字、改善技術正確性或調整版面。
3. **不可以刪除任何既有檔案。**
4. **不可以因改版而刪除舊稿、舊 HTML、舊截圖或舊版建置資源。**
5. 不再使用的檔案仍應保留；可在文件中標註為「舊版」「歷史版本」或「已由新版取代」。
6. 若檔名需要調整，應新增新檔並保留舊檔，不得用刪除舊檔的方式搬移。
7. 自動化腳本只能新增檔案或覆寫既有的衍生檔案，不得包含刪除、清空目錄或移除歷史成果的指令。
8. 不得使用 `rm`、`rmdir`、`git clean` 或其他會刪除專案內容的命令。

若未來需求與此規則衝突，應優先保留資料，並另外新增版本或備註說明。

## Day1 來源

- 課程名稱：115 年中小企業基礎資安培訓課程｜第二期 Day1
- 主辦頻道：資安人蔘
- 串流日期：2026 年 7 月 17 日
- 課程影片：<https://www.youtube.com/watch?v=HaGctbSN7Dw>
- 完整逐字稿：<https://hackmd.io/@lanss/r1r_aowEGx>
- 中小企業資安專家會客室：<https://forms.gle/3asPEqmpQzDJvK8X6>

逐字稿下載後約 200 KB，內容包含上午主課、主辦單位資源導覽、企業經驗分享，以及下午惡意程式與網路架構實作。

## Day1 課程影片

`Day1/index.html` 內嵌了 Day1 課程影片播放器，來源為 GitHub Release 重新提供的版本：<https://github.com/lushinshang/11507_IS_train/releases/download/mv/115.Day1.mp4>（檔案約 1.4GB）。

- 播放器使用 `<video><source type="video/mp4">`，並設定 `preload="none"`，避免頁面一開啟就下載整支影片。
- 播放器旁清楚標示「原始課程出處：YouTube」，並附上 README 前述的 YouTube 直播錄影連結。
- 因單一檔案較大，且伺服器回應的 `Content-Type` 是 `application/octet-stream` 而非標準 `video/mp4`，不同瀏覽器對此的播放相容性可能不同；已實測 Chromium 系瀏覽器可正常播放。播放器旁不提供額外的 GitHub 下載連結，若播放器無法載入，可改看播放器旁的 YouTube 原始直播錄影連結。

## 使用的內容整理方法

Day1 文件以 `ai-mentor`、`deep-guide` 與 `md-to-phtml` 的工作方式整理。

四篇文章統一在開頭加入「摘要」段落、結尾加入「結論」段落，並依段落內容判斷加入以下兩種視覺化輔助之一（各篇約各放一次，並非每個段落都要有）：

- **Mermaid 圖表**：適合流程、關係或循環呈現的段落，直接以靜態 SVG 內嵌 HTML（用 `mermaid-master` skill 產生並驗證），不依賴外部 JS 或 CDN，符合本專案「頁面可直接從本機開啟」的設計原則。SVG 包在 `<div class="mermaid-frame">` 內，樣式定義在 `deepguide_style.html`，手機寬度下可橫向捲動不破版。
- **資訊圖表**：適合大量資訊一次呈現的段落（例如多重面向的比較清單、循環週期），先規劃 AI 產圖 prompt，再用 `md_to_html` skill 內建的 `scripts/codex_imagegen.py`（呼叫 Codex CLI 的 `image_gen` 工具）實際產圖，成功後以 `<figure class="infographic"><img>...<figcaption>` 內嵌頁面，圖片存放於 `Day1/images/`。四篇文章實際使用的 prompt 全文記錄在下方「資訊圖表 prompt 記錄」，供之後需要重新產圖或調整時參考。

Mermaid 圖表的方向規則：**節點數 6 個以下**時，同一張圖會預先產生手機用（直式 `flowchart TD`）與桌面用（橫式 `flowchart LR`）兩個 SVG 版本，包在 `mermaid-frame--mobile` 與 `mermaid-frame--desktop` 兩個容器內，由 `deepguide_style.html` 的 `@media(max-width:760px)` 切換顯示（純 CSS，不需要 JS）；**節點數超過 6 個**時，一律只產生直式（TD）版本，桌面與手機共用同一張圖，不再切換橫式，避免節點過多時橫式圖表在桌面也難以一次看完整條鏈。

資訊圖表的手機適配規則（比照 Mermaid 的邏輯）：只要圖片內嵌了文字標籤，**一定要**額外產生 9:16 直式版本（檔名加 `-mobile` 後綴），否則 16:9／1:1 的圖片被壓縮到手機寬度時，圖內文字會小到無法閱讀。桌面／手機版用 `<picture><source media="(max-width:760px)" srcset="...-mobile.png"><img src="...(桌面版).png"></picture>` 依螢幕寬度切換，純 CSS／HTML 標準行為，不需要 JS。手機版 prompt 不能只寫「同主題、換版面」，要把桌面版圖片裡的具體元素（標題、每個圖示、每段文字標籤）逐一列出，要求 AI 重新排成直式堆疊構圖，否則容易產生「主題一樣但內容元素跑掉」的圖（例如漏掉某個圖示或文字）。

### 資訊圖表 prompt 記錄

以下是四篇文章實際用來產圖的完整 prompt（英文原文，供日後重新產圖、微調風格或製作 Day2 對應圖表時參考）。產圖方式：`python3 /Users/lanss/.claude/skills/md_to_html/scripts/codex_imagegen.py --prompt "..." --image Day1/images/檔名.png --aspect 比例`。

**01｜防禦縱深同心圓城堡圖**（`Day1/images/01_defense-castle.png`，16:9）

> Isometric illustration of a medieval castle with four concentric defensive rings, labeled in Traditional Chinese: 最外層'網路分段', 第二層'分層驗證', 第三層'最小權限', 核心'觀測與誘捕'環繞著中央寶庫。flat vector style, teal and amber color palette matching a cybersecurity training brand, clean labels, no photorealism, 16:9 aspect ratio, mobile-readable text size.

手機版（`01_defense-castle-mobile.png`，9:16）：列出桌面版四個標籤方塊（網路分段／分層驗證／最小權限／觀測與誘捕，含各自圖示與對應顏色）與城堡、寶箱等具體元素，要求改成由上到下堆疊的直式構圖。

**02｜資安衛生四階段循環圖**（`Day1/images/02_cyber-hygiene-cycle.png`，1:1）

> Flat vector circular cycle diagram with four segments arranged clockwise, Traditional Chinese labels: '每月：帳號與備份檢查', '每季：資產清冊與復原抽測', '每半年：情境式事件演練', '每年：風險與預算重排序'. Center icon: a simple heartbeat/pulse symbol representing 'Cyber Hygiene 資安衛生'. Teal and amber palette, rounded segments, mobile-readable label size, 1:1 aspect ratio.

手機版（`02_cyber-hygiene-cycle-mobile.png`，9:16）：圓形循環改成四張直式堆疊卡片，保留原本四個時間週期的圖示與文字，卡片間用箭頭表示流程與循環。

**03｜AI 資安工作流六步驟圖**（`Day1/images/03_ai-workflow.png`，16:9）

> Flat vector horizontal process infographic with 6 numbered steps for a small-business AI security workflow, Traditional Chinese labels in order: '① 選定來源', '② 生成草稿', '③ 人工審查', '④ 小範圍試用', '⑤ 留下回饋', '⑥ 更新知識與流程', with a curved arrow looping from step 6 back to step 1 to show continuous improvement. Simple line icons per step (document, AI spark, magnifying glass, test tube, feedback bubble, refresh arrow). Teal and amber palette, mobile-readable, 16:9 aspect ratio.

手機版（`03_ai-workflow-mobile.png`，9:16）：水平六步驟改成垂直堆疊，保留每個步驟的圖示、編號與文字，步驟六旁畫箭頭繞回步驟一。

**04｜七列防禦對照表圖**（`Day1/images/04_defense-mapping.png`，16:9）

> Flat vector infographic comparing seven rows of a defense mapping table, each row showing three columns in Traditional Chinese: 展示中看見的行為, 企業應建立的防線, 可驗證的證據. Use icons for each attack behaviour (unknown device, new account, new service, sensitive permission, log wipe, lateral movement, disguised attachment). teal and amber color palette matching a cybersecurity training brand, clean grid layout, mobile-readable text size, 16:9 aspect ratio.

手機版（`04_defense-mapping-mobile.png`，9:16）：三欄橫向表格改成七張直式堆疊卡片，每張卡片內仍保留「行為／防線／證據」三個小標籤與對應圖示。

### 專業與實務校準

原需求所稱的 `is-mentor`，在目前環境中以可用的 `ai-mentor` 對應執行，主要用於：

- 將資安與 AI 概念翻成非專業讀者也能理解的語言。
- 保留理論、實務工作流、營運風險與導入成本之間的關係。
- 讓每個主題都能落到中小企業可執行的檢查、決策或演練。
- 檢查建議在異常情境與資源限制下是否仍然可行。

### 深度導讀改寫

導讀不是逐段摘要，而是依下列原則重組逐字稿：

1. 從中小企業最直接的痛點切入。
2. 保留講師使用的城堡、健康管理、木桶、過馬路等比喻。
3. 移除口語贅詞，但保留案例、因果關係與管理取捨。
4. 將分散在不同時段的相關概念集中說明。
5. 把技術操作轉換成防禦問題、檢查方式與行動清單。
6. 不虛構逐字稿沒有提供的數據、研究成果或企業事實。
7. 對課堂中未經外部查核的新聞、價格與速度數字，標示為課堂案例或講者觀點。
8. 對容易造成濫用的攻擊操作，只保留防禦與事件應變意義，不提供可直接執行的入侵步驟。

### 技術正確性校正

逐字稿屬現場口語紀錄，可能包含口誤或過度簡化。導讀會保留課程原意，同時以可靠的一手文件校正技術內容。

Day1 已完成的主要校正包括：

- Windows 事件 `4624` 是成功登入，`4625` 是登入失敗。
- 純記憶體型惡意內容通常無法單靠 RAM 跨完整重開機存活；若重開機後再次出現，通常還有登錄、排程、腳本、WMI 或其他持久性機制。

參考來源：

- Microsoft Learn：<https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/audit-logon>
- Microsoft Security：<https://www.microsoft.com/en-us/security/blog/?p=79862>

## Day1 課程拆分

逐字稿依實際課程段落拆成四篇導讀：

| 編號 | 課程 | 主要內容 |
| --- | --- | --- |
| 01 | 資安事件應變與防禦縱深 | 惡意程式演進、CVE／CVSS、攻擊鏈、CSIRT、備份、IOC／IOA、資產盤點與演練 |
| 02 | 中小企業資安學習與輔導資源 | 自學教材、基本防護指引、決策迷宮、快速提問與專家會客室 |
| 03 | 不用熱血抗資安 | IT／資安／個資一人多工、AI 助理、治理溝通、韌性、AI Agent 與人機覆核 |
| 04 | 惡意程式攻防與網路分段 | Android／Windows 受控展示、端點權限、集中日誌、檔案偽裝、VLAN、委外存取與 AD 防護 |

## 目錄與檔案用途

主要成果位於 `Day1/`。

```text
11507_IS_train/
├── README.md
└── Day1/
    ├── index.html
    ├── 01_資安事件應變與防禦縱深_深度導讀.md
    ├── 01_資安事件應變與防禦縱深_深度導讀.normalized.md
    ├── 01_資安事件應變與防禦縱深_深度導讀.html
    ├── 02_中小企業資安學習與輔導資源_深度導讀.md
    ├── 02_中小企業資安學習與輔導資源_深度導讀.normalized.md
    ├── 02_中小企業資安學習與輔導資源_深度導讀.html
    ├── 03_不用熱血抗資安_AI與資安治理實務_深度導讀.md
    ├── 03_不用熱血抗資安_AI與資安治理實務_深度導讀.normalized.md
    ├── 03_不用熱血抗資安_AI與資安治理實務_深度導讀.html
    ├── 04_惡意程式攻防演示與網路分段_深度導讀.md
    ├── 04_惡意程式攻防演示與網路分段_深度導讀.normalized.md
    ├── 04_惡意程式攻防演示與網路分段_深度導讀.html
    ├── article_nav.html
    ├── article_footer.html
    ├── deepguide_style.html
    ├── build_html.sh
    └── qa_*.png
```

各類檔案用途如下：

- `*.md`：人工維護的主要文章來源。依保存規則繼續留在專案內，但**不再是對外可點的入口**——`index.html` 與文章導覽已改為統一連到 HackMD 逐字稿連結 <https://hackmd.io/@lanss/r1r_aowEGx>（四堂課共用同一連結）。
- `*.normalized.md`：中文標點正規化後的建置來源。
- `*.html`：可直接用瀏覽器開啟的獨立出版版頁面。
- `index.html`：Day1 課程整合首頁，提供四堂課摘要、HTML 閱讀入口、HackMD 逐字稿連結、建議閱讀順序、課程影片播放器與諮詢連結。
- `deepguide_style.html`：四篇文章共用的響應式閱讀樣式。
- `article_nav.html`：文章上方的 Day1 共用導覽。
- `article_footer.html`：文章頁尾與返回目錄入口。
- `build_html.sh`：Markdown 正規化、HTML 轉換與語法檢查流程。
- `qa_*.png`：桌面與手機版面檢查截圖，屬於歷史 QA 證據，不可刪除。

既有的 Day1 全日版導讀及早期 QA 截圖屬歷史成果，即使已由四篇分課程導讀取代，也必須保留。

## HTML 建置流程

文章使用 Pandoc 轉換為獨立 HTML。建置流程由 `Day1/build_html.sh` 執行。

在專案根目錄執行：

```bash
Day1/build_html.sh
```

腳本會依序：

1. 尋找 `Day1/01_` 至 `Day1/04_` 開頭的 Markdown 原稿。
2. 使用 `md-to-phtml` 的標點正規化工具產生 `.normalized.md`。
3. 修正標點工具可能影響的 Markdown 數字清單標記。
4. 使用 Pandoc 產生獨立 HTML。
5. 加入共用樣式、頂部課程導覽與文章頁尾。
6. 使用 Python 標準函式庫的 HTML parser 做語法檢查。
7. 檢查 `Day1/index.html` 語法。

此腳本會更新既有 `.normalized.md` 與 `.html`，但不得刪除任何檔案。

## HTML 設計原則

- 使用台灣用語繁體中文介面。
- 桌面版保留舒適的內文寬度，避免每行過長。
- 手機版自動改為單欄並允許表格橫向捲動。
- 四篇文章提供共用頂部導覽，可直接切換課程。
- 每篇文章頁尾提供返回 `Day1/index.html` 的入口。
- Day1 首頁在桌面使用雙欄課程卡片，手機改為單欄。
- 首頁影片播放器以 16:9 比例自適應寬度，桌面與手機皆滿版顯示，`preload="none"` 避免自動下載大檔案。
- 文章內的 Mermaid 圖表以靜態 SVG 內嵌，手機寬度不足時圖表容器可橫向捲動，不會撐寬整個頁面版型。
- 頁面可直接從本機開啟，不依賴伺服器或外部框架（Mermaid 圖表也以預先產生的 SVG 內嵌，不在瀏覽器端載入 Mermaid.js）。

## 驗證與 QA

每次修改 Markdown、樣式、導覽或首頁後，至少執行以下檢查。

### HTML 語法

```bash
python3 -m html.parser Day1/index.html
python3 -m html.parser Day1/01_資安事件應變與防禦縱深_深度導讀.html
python3 -m html.parser Day1/02_中小企業資安學習與輔導資源_深度導讀.html
python3 -m html.parser Day1/03_不用熱血抗資安_AI與資安治理實務_深度導讀.html
python3 -m html.parser Day1/04_惡意程式攻防演示與網路分段_深度導讀.html
```

### 視覺檢查

目前已保存的主要 QA 截圖包括：

- `Day1/qa_index_desktop.png`
- `Day1/qa_index_mobile.png`
- `Day1/qa_course01_desktop.png`
- `Day1/qa_course04_mobile.png`

課程優化改版（影片播放器、HackMD 連結、Mermaid／資訊圖表 prompt）後新增的截圖（`_v2` 後綴，不覆蓋上述舊檔）：

- `Day1/qa_index_desktop_v2.png`
- `Day1/qa_index_mobile_v2.png`
- `Day1/qa_course01_desktop_v2.png`
- `Day1/qa_course01_mobile_v2.png`

視覺檢查項目：

- 標題是否平衡且不超出版面。
- 內文行長與行距是否適合長文閱讀。
- 表格在手機是否能正常捲動。
- 頂部導覽是否遮住內容。
- 課程卡片與按鈕是否能在手機單欄顯示。
- 所有本機 HTML 與 Markdown 連結是否存在。
- 頁面是否出現建置提示、內部路徑或其他不應公開的製作資訊。

每次重新 QA 應新增具辨識度的新截圖；若需要保留同一檔名，可修改既有截圖，但不得刪除歷史檔案。

## Day2 製作 SOP

本節依 Day1 實際製作過程整理，把過程中踩過的坑與後補的規則直接寫進步驟裡，Day2（或未來其他期別）製作時可直接照做，減少重工。新增日期一律採用相同目錄慣例（例如 `Day2/`），且全程遵守本專案最上方的保存鐵律：**新增與修改可以，刪除不可以。**

### 1. 逐字稿取得與課程段落拆分

- 取得該日完整逐字稿（HackMD 或其他來源），連同課程影片、串流日期、報名／諮詢連結一併記錄。
- 先依講者、休息、主持人串場與課程主題辨認實際堂次，不要照時間軸機械切割——同一堂課中間可能被主持人串場打斷，休息前後也可能其實是同一堂課。
- 拆分結果先列成清單（編號、課程名稱、講者、主要內容），比照 README「Day1 課程拆分」表格的格式。

### 2. 深度導讀改寫原則

- 不是逐段摘要，而是重組：從讀者最直接的痛點切入，保留講師使用的比喻與案例，移除口語贅詞但保留因果關係與管理取捨。
- 把分散在不同時段的相關概念集中說明；把技術操作轉換成檢查方式與行動清單。
- 不虛構逐字稿沒有提供的數據、研究成果或企業事實；對未經外部查核的新聞、價格、速度數字，標示為課堂案例或講者觀點。
- 對容易被濫用的攻擊操作，只保留防禦與事件應變意義，不寫可直接執行的入侵步驟。

### 3. 技術正確性校正

- 逐字稿是口語紀錄，可能有口誤或過度簡化，需要用可靠的一手文件（官方文件、廠商安全公告等）校正，並在文中或 README 記錄校正內容與參考來源 URL。

### 4. 摘要與結論

- 每篇文章開頭加「## 摘要」，用一段 blockquote 概括全文重點；結尾（來源與閱讀說明／名詞速查之前）加「## 結論」，呼應開頭主軸，兩者都必須忠於本文既有內容，不加新案例或數據。

### 5. Mermaid 圖表規則（Day1 中途才確立，務必從一開始就照此做）

- 適合流程／關係／循環呈現的段落，用 `mermaid-master` skill 畫圖：先寫 `.mmd`、跑 `python3 <mermaid-master>/scripts/mermaid_check.py` 驗證結構、再用 `scripts/mermaid_to_image.py` 轉成靜態 SVG（不要在瀏覽器端載入 Mermaid.js，維持「頁面可直接從本機開啟」的設計原則）。
- **方向規則**：節點數 **6 個以下** → 同時產生手機用直式（`flowchart TD`）與桌面用橫式（`flowchart LR`）兩個 SVG 版本，包進 `mermaid-frame mermaid-frame--mobile` 與 `mermaid-frame mermaid-frame--desktop` 兩個容器，靠 `deepguide_style.html` 既有的 `@media(max-width:760px)` CSS 切換顯示（純 CSS，不需 JS）。節點數 **超過 6 個** → 一律只做直式（TD），桌面與手機共用同一張圖，不要做橫式版本。
- SVG 內嵌時前後都要留空行，gfm 才會把它當成 raw HTML 區塊正確保留（不會被 pandoc 逃逸成純文字）。

### 6. 資訊圖表

- 適合大量資訊一次呈現的段落（多重面向比較清單、循環週期等），先規劃 AI 產圖 prompt。若使用者只要求先規劃不產圖，就放一段「🖼️ 資訊圖表建議（AI 產圖 prompt，尚未產圖，先放文字佔位）」的 blockquote 佔位；若要求實際產圖，改用下一步驟直接產生。
- **實際產圖**：用 `python3 /Users/lanss/.claude/skills/md_to_html/scripts/codex_imagegen.py --prompt "..." --image Day1/images/檔名.png --aspect 16:9`（或 1:1／4:3）產生桌面版。產圖前確認 `codex login status` 已登入、`codex --version` ≥ 0.130。
- **手機直式版（務必做）**：只要圖片內嵌文字標籤，一律額外產生 9:16 版本（檔名加 `-mobile`），prompt 要把桌面版的具體元素（標題、每個圖示、每段文字）逐一列出，要求重新排成直式堆疊，不能只寫「同主題換版面」（容易產生元素跑掉的圖）。
- 產圖成功後，把 md 裡的 prompt blockquote 換成：
  ```html
  <figure class="infographic">
  <picture>
  <source media="(max-width: 760px)" srcset="images/檔名-mobile.png">
  <img src="images/檔名.png" alt="...">
  </picture>
  <figcaption>...</figcaption>
  </figure>
  ```
- 圖片存於 `Day2/images/`；`<figure class="infographic">`／`<picture>` 的 CSS 已在 `deepguide_style.html` 定義好，不用再加樣式。
- 完成後把實際用的 prompt 全文記錄進本 README 對應的「資訊圖表 prompt 記錄」章節，供之後重新產圖參考。

### 7. HackMD 連結策略

- 對外的「查看逐字稿」入口一律連到 HackMD 逐字稿連結，不要連本機 `.md` 檔；本機 `.md`／`.normalized.md` 依保存鐵律繼續留在磁碟上，只是不再是對外可點的入口。

### 8. RWD 與共用樣式

- 沿用 `deepguide_style.html`、`article_nav.html`、`article_footer.html`；新增樣式（例如新的區塊、圖表容器）一律要同時在桌面與手機寬度下確認不破版、不橫向溢出。

### 9. HTML 建置與語法驗證

- 用 `Day1/build_html.sh` 的模式（複製一份改路徑，或參數化成可指定日期目錄）跑 Pandoc 產生 HTML，每次產出後對所有 HTML 執行 `python3 -m html.parser <file>`，全數 exit code 0 才算過。

### 10. Playwright 實測與 QA 截圖

- 用 Playwright 在桌面（≥1280px）與手機（≤420px）寬度分別開啟頁面，檢查 `scrollWidth <= clientWidth + 2`（無橫向溢出）、關鍵互動元素（連結、影片播放器、圖表切換）行為正確。
- Chrome 對本機 `file://` 有安全限制會擋掉 Playwright，測試時改用 `python3 -m http.server <port>` 開臨時本機伺服器，測完要關閉，不留下常駐程序。
- 新截圖一律用新檔名（例如加日期或版本後綴），不覆蓋、不刪除既有截圖。

### 11. SDD 流程紀律

- 走「提案→使用者確認→逐條任務實作並回報→全部完成後派 fresh agent 驗收→歸檔」的完整流程；未經使用者確認的提案不能進入實作。
- 大型或可拆分的獨立任務（例如四篇文章各自的內容整理）可以同時派多個 subagent 平行處理，加速完成，但仍要在每條任務完成後個別驗證與回報，不能只憑 subagent 的自我回報就當作完成。
- 全部任務打勾後，一律派「沒看過實作過程」的 fresh agent 做最終驗收（驗證不自驗），不要自己驗自己。

### 12. 收尾

- 更新本 README：加入新目錄、來源、SOP 執行中發現的例外或調整、以及新增的 QA 截圖清單。
- 根目錄總入口 `index.html`（見上方「多期別總入口」）：Day2 製作完成後記得把 Day2 卡片從「製作中」改成可點擊連結。

## 維護檢查清單

每次工作完成前確認：

- [ ] 沒有刪除任何既有檔案。
- [ ] 沒有使用會清空目錄或移除歷史成果的指令。
- [ ] 新增或修改的 Markdown 使用台灣用語繁體中文。
- [ ] 內容忠於逐字稿，未虛構案例或數據。
- [ ] 技術校正有可靠來源或清楚說明判斷依據。
- [ ] 攻擊示範只保留防禦與合法研究所需內容。
- [ ] 已重新產生或更新 HTML。
- [ ] HTML 已通過語法檢查。
- [ ] 已檢查桌面與手機版面。
- [ ] 每日首頁已加入新課程入口。
- [ ] README 已反映新的檔案與流程。

