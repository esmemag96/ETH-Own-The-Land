// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract OwnTheLand is ERC721 {
    event PropertyUpdate(
        uint indexed propertyId,
        uint256 indexed metadata,
        uint256 value,
        address indexed owner
    );

    struct Property {
        uint256 metadata;
        uint256 value;
        address owner;
    }

    uint private _propertyId = 0;

    Property[] public properties;

    mapping(uint => address) public propertyToOwner;
    mapping(address => uint) ownerPropertiesCount;
    mapping(uint => address) propertyApprovals;
    mapping(uint => Property) public propertyMapping;

    constructor() ERC721("PropertyManagement", "PMT") {}

    modifier onlyOwnerOf(uint _id) {
        require(msg.sender == propertyToOwner[_id]);
        _;
    }

    function createProperty(uint256 _metadata, uint256 _value) external {
        Property memory _property = Property(_metadata, _value, msg.sender);
        uint id = _propertyId;
        _propertyId = _propertyId++;
        properties.push(_property);
        propertyMapping[id] = _property;
        propertyToOwner[id] = msg.sender;
        ownerPropertiesCount[msg.sender]++;
        emit PropertyUpdate(id, _metadata, _value, msg.sender);
        _propertyTransfer(address(0), msg.sender, id);
    }

    function updateProperty(
        uint id,
        uint256 _metadata,
        uint256 _value
    ) external {
        require(ownerOf(id) == msg.sender);
        Property memory _property = propertyMapping[id];
        _property.metadata = _metadata;
        _property.value = _value;
        propertyMapping[id] = _property;
        emit PropertyUpdate(id, _metadata, _value, msg.sender);
    }

    function balanceOf(address _owner)
        public
        view
        override
        returns (uint256 _balance)
    {
        return ownerPropertiesCount[_owner];
    }

    function ownerOf(uint256 _propertyTokenId)
        public
        view
        override
        returns (address)
    {
        return propertyToOwner[_propertyTokenId];
    }

    function _propertyTransfer(
        address _from,
        address _to,
        uint256 _propertyTokenId
    ) private {
        ownerPropertiesCount[_to]++;
        ownerPropertiesCount[_from]--;
        propertyToOwner[_propertyTokenId] = _to;
        emit Transfer(_from, _to, _propertyTokenId);
    }

    function transfer(address _to, uint256 _propertyTokenId)
        public
        onlyOwnerOf(_propertyTokenId)
    {
        _propertyTransfer(msg.sender, _to, _propertyTokenId);
    }

    function approve(address _to, uint256 _propertyTokenId)
        public
        override
        onlyOwnerOf(_propertyTokenId)
    {
        propertyApprovals[_propertyTokenId] = _to;
        emit Approval(msg.sender, _to, _propertyTokenId);
    }

    function takeOwnership(uint256 _propertyTokenId) public {
        require(propertyApprovals[_propertyTokenId] == msg.sender);
        address owner = ownerOf(_propertyTokenId);
        _propertyTransfer(owner, msg.sender, _propertyTokenId);
    }
}
