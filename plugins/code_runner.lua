
require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "ipython",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		javascript = "node",
		markdown = "glow",
		cpp = "cd $dir g++ $fileName && -o $dir/$fileNameWithoutExt",
		go = "go run",
		sh = "sh",
	},
})
