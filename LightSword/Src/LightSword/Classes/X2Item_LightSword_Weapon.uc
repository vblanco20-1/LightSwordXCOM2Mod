//---------------------------------------------------------------------------------------
//  FILE:   X2Item_LightSword_Weapon.uc
//  AUTHOR:  Victor Blanco
//           
// 	Defines the template for a lightsaber sword with extra armor damage
//   	
//  

class X2Item_LightSword_Weapon extends X2Item; 

//Template classes are searched for by the game when it starts. Any derived classes have their CreateTemplates function called
//on the class default object. The game expects CreateTemplates to return a list of templates that it will add to the manager
//reponsible for those types of templates. Later, these templates will be automatically picked up by the game mechanics and systems.
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_LightSword());

	return ModWeapons;
}

//Template creation functions form the bulk of a template class. This one builds our custom weapon.
static function X2DataTemplate CreateTemplate_LightSword()
{
	local X2WeaponTemplate Template;
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'LightSword_CV');
	//`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Sword_MG');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.BeamSecondaryWeapons.BeamSword";
	Template.EquipSound = "Sword_Equip_Magnetic";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype ="WP_LightSword.WP_LaserSword";
	//Template.AddDefaultAttachment('R_Back', "MagSword.Meshes.SM_MagSword_Sheath", false);
	Template.Tier = 4;

	Template.iRadius = 1;
	Template.NumUpgradeSlots = 2;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType='Melee';

	Template.BaseDamage.Pierce += 4;
	Template.BaseDamage.Shred += 4;
	//Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));
	Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(3, 1));

	Template.UpgradeItem = 'Sword_BM';
	Template.StartingItem = true;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Melee';
	
	
	return Template;



}
