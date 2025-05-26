#ifndef __SKILL_PLAYERWRAPPER_H
#define __SKILL_PLAYERWRAPPER_H

#include "skillwrapper.h"

namespace GNET
{
	struct PlayerInfo;

	struct UseRequirement
	{
		enum { ENERGY_NUM = 2 };

		UseRequirement() { memset(this, 0, sizeof(*this)); }

		int level;				//��ҵȼ�
		int prof;				//���ְҵ
		int dmg_low;			//����������
		int dmg_high;			//����������
		int hp;					//hp
		int maxhp;				//���hp
		int mp;					//ħ��
		int maxmp;				//���mp
		int	ap;					//ŭ��
		int vp;					//����
		int energy[ENERGY_NUM];	//ְҵ����1,2
		int state_mask;			//��ɫ״̬����
		int lies;				//��ɫ����״̬
		int shape;				//����id
		int item_id;			//��Ʒ��id
		int item_amount;		//��Ʒ������
		int weapon_hold;		//0�� 1���� 2˫�ֽ� 3ħ�� 4ʥ�� 5˫���� 6����� 7צ 8ذ��
		int  inst_type;			//��������
		bool adsorption_disable;//�Ҽ��Ƿ��ְҵ����
		bool isfight;			//����Ƿ���ս��״̬
	};


	class PlayerWrapper
	{
	public:
		typedef unsigned int	SID;
		typedef unsigned int	PID;

		float range;
		UseRequirement _info;
	private:
		PlayerInfo * object;

	private:
		//�洢��ǰ���buff id��buff�ȼ���ӳ��
		typedef abase::hash_map<int, int, abase::_hash_function> BuffLevelMap;
		static BuffLevelMap bufflevels;

	public:
		static int GetBuffLevel(int buffid)
		{
			BuffLevelMap::iterator it = bufflevels.find(buffid);
			return it==bufflevels.end() ? 0 : it->second;
		}

		static void AddBuffLevel(int buffid, int bufflevel)
		{
			bufflevels[buffid] = bufflevel;
		}

		static void RemoveBuffLevel(int buffid)
		{
			bufflevels.erase(buffid);
		}

		static bool IsExistBuff(int buffid, int bufflevel)
		{
			typedef BuffLevelMap::iterator iterator;
			iterator it = bufflevels.find(buffid);
			return (it != bufflevels.end() && it->second >= bufflevel);
		}

		void SetData(const UseRequirement &info)
		{
			_info = info;
		}

		int GetLevel() { return _info.level; }
		int GetHp() { return _info.hp; }
		int GetMp() { return _info.mp; }
		int GetMaxhp() { return _info.maxhp; }
		int GetMaxmp() { return _info.maxmp; }
		int GetDamagehigh() { return _info.dmg_low; }
		int GetDamagelow() { return _info.dmg_high; }
		int GetCurPorfession() { return _info.prof; }

		int GetSkilllevel(int id)
		{
			return SkillWrapper::Instance()->GetLevel(id);
		}

		int GetBufflevel(int id)
		{
			return GetBuffLevel(id);
		}

	public:
		PlayerWrapper() : range(0) { }
		PlayerWrapper(PlayerInfo * o) : range(0), object(o) { }

		void SetRange(float r) { range = r; }

		int GetMP()
		{
			return 10000;
		}

		int GetSp( )
		{
			return 10000;
		}

		bool IsRiding()
		{
			return false;
		}

		bool IsUsingWeapon(int weapon)
		{
			return true;
		}

		bool HasSkillBook( SID id )
		{
			return true;
		}

		bool SetDecsp(int sp)
		{
			return true;
		}

		bool SetDistance(float d)
		{
			return true;
		}

		float GetWeapondistance()
		{
			return -1;
		}

		bool SetDecmp(int m)
		{
			return true;
		}

		bool SetPray(bool)
		{
			return true;
		}

		bool SetInform(bool)
		{
			return true;
		}


		bool SetPerform(bool)
		{
			return true;
		}

		bool SetDamage(int)
		{
			return true;
		}
		int GetPerform()
		{
			return 1;
		}

		int GetDamage()
		{
			return 1;
		}

		int GetBasetime()
		{
			return 0;
		}
		float GetRange()
		{
			return range;
		}
		bool SetCheckbook(int i) { return true;}
		int GetCheckbook() { return 0;}
		bool SetCheckmoney(int m) { return true; }
		int GetCheckmoney() { return 0;}
		bool SetUsebook(int i) {return true; }
		int GetUsebook() { return 0;}
		bool SetUsemoney(int m) { return true; }
		int GetUsemoney() { return 0;}
	};
}

#endif

