defmodule Mix.Tasks.PreflightCheck do
        use Mix.Task

        def run(_) do
			Microformats2
			Mix.Task.run("escript.build")
        end
end

