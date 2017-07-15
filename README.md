目的
--------
* 記錄 .vimrc 檔案中，每一行設定做些什麼用，用中文做備忘。
* 試著記錄 plugin 的安裝與用法。
* 方便在多台電腦上同步 vim 的環境。

使用方法：
--------

* 直接執行 setup_vim.sh 。這指令會看看目前使用者的家目錄裡有沒有 .vimrc這個檔案，沒有的話，就做個Symbolic Link。
* 把 plugin 下載回來: git submodule update --init
* 以後要是有在repo上更新，切換到 vimrc 的 git repo, 下指令 git pull 就可以完成同步了。

檔案說明
--------
* .gitmodules 
   利用 git submodule add 指令取得 plugin 時，自動會更新的檔案。
   例如： 
   ```
   git submodule add https://github.com/wesleyche/Trinity
   ```
   指令下完，會 git clone 出一個 Trinity 的目錄，內含 Trinity plugin。
   在 git push 之後，github 看到的則是類似 "Trinity @ 8c6ac7c"的目錄連結。
   若要加入新的 plugin ，就執行類似的指令即可。

* vimrc
  vim 的設定檔，~/.vimrc 在執行 setup_vim.sh 時，symbolic link 到這個檔。

* setup_vim.sh
1.   把使用 git submodule 抓下的 plugin 內的檔案，給連結好，以便使用。
2.   把 vimrc 給連結好。
  

