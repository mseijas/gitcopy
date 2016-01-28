require "git"

class GitCopy
	@tempDir = './temp'

	def self.cloneRepo(repoPath)
		ensureValidRepo(repoPath)
		`git clone #{repoPath} #{@tempDir}`
		`rm -rf #{@tempDir}/.git`
		`mv #{@tempDir}/* .`
		`rm -rf #{@tempDir}`
	end

	def self.ensureValidRepo(repoPath)
		if !repoPath
			fatalError("Please provide a valid github repo")
		end

		repoProtocol = GitProperties.repoProtocol(repoPath)
		repoName = GitProperties.repoName(repoPath)
		repoExtension = GitProperties.repoExtension(repoPath)
		repoDirname = GitProperties.repoDirName(repoPath)

		if repoProtocol != "http" || repoExtension != ".git"
			fatalError("Please provide a valid github repo")
		end
	end

	def self.fatalError(error)
		puts "Error: #{error}"
		exit(false)
	end
end

class GitProperties
	def self.repoProtocol(repoPath)
		repoProtocol = repoPath[0...4]
		return repoProtocol
	end

	def self.repoName(repoPath)
		repoName = repoPath.split("/").last
		return repoName
	end

	def self.repoExtension(repoPath)
		repoName = repoName(repoPath)
		repoExtension = repoName.split(//).last(4).join
		return repoExtension
	end

	def self.repoDirName(repoPath)
		repoName = repoName(repoPath)
		repoExtension = repoExtension(repoPath)
		repoDirName = repoName[0...-repoExtension.length]
		return repoDirName
	end
end