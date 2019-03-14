class Factory: IFactory {

    func block(withHeader header: BlockHeader, previousBlock: Block) -> Block {
        return Block(withHeader: header, previousBlock: previousBlock)
    }

    func block(withHeader header: BlockHeader, height: Int) -> Block {
        return Block(withHeader: header, height: height)
    }

    func transaction(version: Int, inputs: [TransactionInput], outputs: [TransactionOutput], lockTime: Int) -> Transaction {
        return Transaction(version: version, inputs: inputs, outputs: outputs, lockTime: lockTime)
    }

    func transactionInput(withPreviousOutputTxReversedHex previousOutputTxReversedHex: String, previousOutputIndex: Int, script: Data, sequence: Int) -> TransactionInput {
        return TransactionInput(withPreviousOutputTxReversedHex: previousOutputTxReversedHex, previousOutputIndex: previousOutputIndex, script: script, sequence: sequence)
    }

    func transactionOutput(withValue value: Int, index: Int, lockingScript script: Data = Data(), type: ScriptType = .unknown, address: String? = nil, keyHash: Data? = nil, publicKey: PublicKey? = nil) -> TransactionOutput {
        return TransactionOutput(withValue: value, index: index, lockingScript: script, type: type, address: address, keyHash: keyHash, publicKey: publicKey)
    }

    func peer(withHost host: String, network: INetwork, networkMessageParser: NetworkMessageParser, logger: Logger? = nil) -> IPeer {
        return Peer(host: host, network: network, connection: PeerConnection(host: host, network: network, networkMessageParser: networkMessageParser, logger: logger), connectionTimeoutManager: ConnectionTimeoutManager(), logger: logger)
    }

    func blockHash(withHeaderHash headerHash: Data, height: Int, order: Int = 0) -> BlockHash {
        return BlockHash(headerHash: headerHash, height: height, order: order)
    }

    func bloomFilter(withElements elements: [Data]) -> BloomFilter {
        return BloomFilter(elements: elements)
    }

}
