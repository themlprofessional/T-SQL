create table NashvilleHousing (
  ParcelID int,
  PropertyAddress varchar(255),
  SalePrice int,
  SaleDate date,
  LegalRefference varchar(255),
  UniqueID int
  )

insert into NashvilleHousing(ParcelID, PropertyAddress, SalePrice, SaleDate, LegalRefference, UniqueID)
values
(1, '123 Main Street', 100000, '2023-01-01', 123456789, 1),
(2, '456 Elm Street', 200000, '2023-02-01', 987654321, 2),
(3, '789 Oak Street', 300000, '2023-03-01', 012345678, 3),
(3, '789 Oak Street', 300000, '2023-03-01', 012345678, 4)

select * from NashvilleHousing;

with RowNumCTE as (
  select *,
  row_number() over(
  partition by ParcelID, PropertyAddress, SalePrice, SaleDate, LegalRefference
  order by UniqueID )
  as row_number
  from NashvilleHousing
  )

-- delete
select * from RowNumCTE
where row_number > 1
order by PropertyAddress;
