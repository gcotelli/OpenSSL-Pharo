actions
digestSignInit
	| md |
	
	self errorIfNull: handle.
	self makeMessageDigestContext.	
	md := LcLibCrypto current apiEvpSHA256. 
	
	self errorIfZeroOrNegative: 
		(LcLibCrypto current 
			apiEvpDigestSignInit: mdCtx 
			with: LcEvpPkeyCtxForeign new
			with: md
			with: LcEngineForeign new 
			with: handle)
			