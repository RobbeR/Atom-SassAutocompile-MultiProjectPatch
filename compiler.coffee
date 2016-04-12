    getOutputFile: (outputStyle) ->
        outputFile =
            style: outputStyle
            isTemporary: false

        if @isCompileDirect()
            outputFile.path = File.getTemporaryFilename('sass-autocompile.output.', null, 'css')
            outputFile.isTemporary = true
        else
            switch outputFile.style
                when 'compressed' then pattern = @options.compressedFilenamePattern
                when 'compact' then pattern = @options.compactFilenamePattern
                when 'nested' then pattern = @options.nestedFilenamePattern
                when 'expanded' then pattern = @options.expandedFilenamePattern
                else throw new Error('Invalid output style.')

        RobbeRInputBasePath = @inputFile.path
        RobbeRMappings      = pattern.split ";"
        RobbeRMappings.forEach (element, index, array) ->
            RobbeRMappingParts  = element.split ":"
            RobbeRBasePath      = ""
            RobbeRTargetPath    = ""
            [RobbeRBasePath, RobbeRTargetPath]      = RobbeRMappingParts

            pos = RobbeRInputBasePath.indexOf RobbeRBasePath
            if pos == 0
                RobbeRTargetFile    = RobbeRTargetPath + RobbeRInputBasePath.replace(RobbeRBasePath, '').replace(".scss", ".css")
                console.log RobbeRTargetFile
                filename = RobbeRTargetFile

                outputFile.path = filename

        return outputFile


    # getOutputFile: (outputStyle) ->
    #     outputFile =
    #         style: outputStyle
    #         isTemporary: false
    #
    #     if @isCompileDirect()
    #         outputFile.path = File.getTemporaryFilename('sass-autocompile.output.', null, 'css')
    #         outputFile.isTemporary = true
    #     else
    #         switch outputFile.style
    #             when 'compressed' then pattern = @options.compressedFilenamePattern
    #             when 'compact' then pattern = @options.compactFilenamePattern
    #             when 'nested' then pattern = @options.nestedFilenamePattern
    #             when 'expanded' then pattern = @options.expandedFilenamePattern
    #             else throw new Error('Invalid output style.')
    #
    #         RobbeRBasePath      = "/Users/ignaczrobert/Web/bcoin2/assets/sass/"
    #         RobbeRTargetPath    = "/Users/ignaczrobert/Web/bcoin2/assets/css/"
    #
    #         basename = path.basename(@inputFile.path)
    #         console.log "test"
    #         # we need the file extension without the dot!
    #         fileExtension = path.extname(basename).replace('.', '')
    #
    #         filename = basename.replace(new RegExp('^(.*?)\.(' + fileExtension + ')$', 'gi'), pattern)
    #
    #         if not path.isAbsolute(path.dirname(filename))
    #             outputPath = path.dirname(@inputFile.path)
    #             filename = path.join(outputPath, filename)
    #
    #         outputFile.path = filename
    #
    #     return outputFile
