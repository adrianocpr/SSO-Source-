#ifndef _SKILL_ENUM_H_
#define _SKILL_ENUM_H_

namespace GNET
{

enum 
{ 
	TYPE_ATTACK				= 1, // ��������
	TYPE_BLESS				= 2, // ����ף��
	TYPE_CURSE				= 3, // ��������
	TYPE_PASSIVE			= 4, // �������� 
	TYPE_ASSIST				= 5, // ��������
	TYPE_SYNTHESIS			= 6, // �ϳɼ��� 
};

enum 
{ 
	MODE_AUTO				= 1, //�Զ�����
	MODE_HAND				= 2, //�ֶ�ʩ��
	MODE_TOOL				= 3, //����ʹ��
	MODE_AURA				= 4, //�⻷���� 
	MODE_PASSIVE			= 5, //������Ч 
	MODE_SWITCH				= 6, //���ؼ��� 
	MODE_SPECIAL_SWITCH		= 7, //���⿪��
	MODE_CONDITION			= 8, //��������
};

enum 
{ 
	ORIGIN_LEARN			= 1, //ѧϰ���� 
	ORIGIN_TALENT			= 2, //�츳����
	ORIGIN_INNATE			= 3, //��������
	ORIGIN_SUBJOIN			= 4, //װ�����Ӽ���
};

enum ATTACK_RANGE
{
	RANGE_INVALID				= -1,
	RANGE_TARGET_POINT			= 0, // ѡ�ж��� �� 
	RANGE_TARGET_LINE			= 1, // ѡ�ж��� ��
//	RANGE_TARGET_SELFBALL		= 2, // ѡ�ж��� ����Ϊ���ĵ���
	RANGE_TARGET_BALL			= 3, // ѡ�ж��� Ŀ��Ϊ���ĵ���
	RANGE_TARGET_SECTOR			= 4, // ѡ�ж��� ����Ϊ���ĵ�����

	RANGE_POINT					= 5, // ��ѡ�ж��� ��
	RANGE_LINE					= 6, // ��ѡ�ж��� ��
//	RANGE_SECTOR				= 7, // ��ѡ�ж��� ����Ϊ���ĵ�����
	RANGE_SELFBALL				= 8, // ��ѡ�ж��� ����Ϊ���ĵ���
	RANGE_AREA					= 9, // ѡ������Բ��Բ��
	RANGE_MASTER				= 10,// ��������
	RANGE_TARGET_CUR_LINE		= 11,// ѡ�ж��� �� ��ȡĿ�굱ǰ�� ���ã�
	RANGE_TARGET_CUR_BALL		= 12,// ѡ�ж��� Ŀ��Ϊ���ĵ��� ��ȡĿ�굱ǰ�� ���ã�
	RANGE_TARGET_CUR_SECTOR		= 13,// ѡ�ж��� ����Ϊ���ĵ����� ��ȡĿ�굱ǰ�� ���ã�

	RANGE_NUM
};

enum PERFORM_MODE
{
	PERFORM_EMPTY			= 0,
	PERFORM_NORMAL			= 1,
	PERFORM_NOSTATE			= 2,
	PERFORM_NODAMAGE		= 3,
};

enum 
{ 
	FEEDBACK_HIT			= 0x01, //����������Ϣ
	FEEDBACK_DAMAGE			= 0x02, //������Ѫ��Ϣ
	FEEDBACK_KILL			= 0x04, //����ɱ����Ϣ 
	FEEDBACK_MISS			= 0x08, //����δ������Ϣ
	FEEDBACK_NODAMAGE		= 0x70, //�������˺�
	FEEDBACK_NOSTATE		= 0x80, //���β���״̬��
};

enum SKILL_MASK 
{
	MASK_COMMON_SKILL		= 0x00,	//��ͨ����
	MASK_DEFAULT_SKILL		= 0x01,	//Ĭ�ϼ���
	MASK_ADDON_SKILL		= 0x02,	//���Ӽ���
	MASK_SHAPE_SKILL		= 0x04,	//�����Ӽ���
	MASK_FAMILY_SKILL		= 0x08,	//���弼��
};

enum 
{
	FLAG_IMMUNE				= 0x100, //���߹���
	FLAG_MISS				= 0x200, //δ����
	FLAG_CRIT				= 0x400, //�˴ι����Ǳ��� 	
	FLAG_DIRECT				= 0x2000,//ֱ��
};

enum 
{
	SNOTIFY_IMMUNEMASK		= 0, // ��������ı�
	SNOTIFY_UPDATEMASK		= 1, // ״̬MASK�ı�
	SNOTIFY_SWITCHON		= 2, // ���ܿ���״̬����
	SNOTIFY_SWITCHOFF		= 3, // ���ܿ���״̬�ر�
};

enum 
{
	CONTEXT_IDLE			= 0, //����
	CONTEXT_ATTACK			= 1, //�չ�
	CONTEXT_PRAY			= 2, //����
	CONTEXT_PERFORM			= 3, //ִ��
	CONTEXT_INSTANT			= 4, //˲�� 
	CONTEXT_VICTIM			= 5, //Ŀ��
	CONTEXT_PASSIVE			= 6, //������Ч
};

enum 
{
	PASSIVE_SKILL_EFFECT		= 0, //����������Ч
	PASSIVE_SKILL_UNDOEFFECT	= 1, //��������ʧЧ
	PASSIVE_SKILL_RESET			= 2, //������������ 
};

enum ADD_BUFF_RET
{
	INSERT_NEW_SKILL			= 0, //�²��뼼��
	NOT_INSERT_NEW_SKILL		= 1, //δ�²��뼼��
};

enum DEL_BUFF_RET
{
	ERASE_SKILL				= 0, //ɾ���Ѵ��ڵļ���
	NOT_ERASE_SKILL			= 1, //δɾ����
	SKILL_NOT_FOUND			= 2, //��map��δ�ҵ��ü���
};

enum PROCESS_SKILL_RET
{
	PSR_INVALID				= -1, //��Чֵ
	PSR_CONTINUE			= 0,  //��������
	PSR_OVER				= 1,  //��������
};

enum
{
	COMBO_CAST_SUCCESS		= 0, //key������ȷ��ʩ�ųɹ�
	COMBO_CAST_FAILURE		= 1, //key���д���ʩ��ʧ�� 
	COMBO_CAST_TIMEOUT		= 2, //��ʱ,ʧ��
};

enum COMPARE_PRIORITY_RET
{
	CPR_FAIL				= -1,//ʧ��
	CPR_GT					= 0, //ǰ�����ȼ����ں���
	CPR_EQ					= 1, //ǰ�����ȼ����ں���
	CPR_LT					= 2, //ǰ�����ȼ�С�ں���
};

enum
{
	SKILL_EXTRA_FLAG_NONE		= 0, //�ޱ�ʾ
	SKILL_EXTRA_FLAG_MICROCOSM	= 1, //С���漼��
	SKILL_EXTRA_FLAG_PETAUTO	= 2, //�����Զ�����
	SKILL_EXTRA_FLAG_NPC_PRAY	= 3, //������������ʾ
	SKILL_EXTRA_FLAG_HUG		= 4, //��ˤ
	SKILL_EXTRA_FLAG_CAST		= 5, //Ͷ��
};

enum MOVE_STYLE
{
	MOVE_STYLE_INVALID		= -1,	
	MOVE_STYLE_COMMON		= 0, //��ͨ
	MOVE_STYLE_FLASH		= 1, //����
};

enum
{
	SC_BOTH					= 0, //��ˣ����涼��ʹ��
	SC_EARTH				= 1, //���棬���״̬������ 
	SC_MOUNT				= 2, //���״̬��ʹ��
	SC_ABS_EARTH			= 3, //���Ե��棬���״̬�²���ʹ��
	SC_AIR					= 4, //����, ���������к���˷���
};

enum MOVE_MODE
{
	MOVE_NONE				= 0,	//��
	MOVE_2_TARGET			= 1,	//�ƶ���Ŀ��
	MOVE_2_BACK				= 2,	//�ƶ���Ŀ�걳��
	MOVE_NOTARGET_AHEAD		= 3,	//��Ŀ��ǰ��
	MOVE_NOTARGET_BACK		= 4,	//��Ŀ����
	MOVE_NOTARGET_LEFT		= 5,	//��Ŀ�����
	MOVE_NOTARGET_RIGHT		= 6,	//��Ŀ���ҳ�
	MOVE_DIRECTION			= 7,	//ָ�������
	MOVE_NO_TARGET			= 8,	//����ǰ�弼��
};

enum SHOW_TYPE
{
	ST_HIDE					= 0,	//����
	ST_PROFESSION			= 1,	//ְҵ������
	ST_TALENT				= 2,	//�츳������
	ST_BASIC				= 3,	//������
	ST_BURST				= 4,	//������
	ST_PET					= 5,	//������
	ST_ORIGINAL				= 6,	//ԭ��������
	ST_SOUL					= 7,	//���꼼��
	ST_ARMY					= 8,	//���ż���
	ST_SAINT_GUARD			= 9,	//ʥ���ػ���
};

enum 
{ 
	SHOW_NORMAL				= 0, //������ʾ
	SHOW_HIDE				= 1, //����
};

enum 
{ 
	TIME_NORMAL				= 1, //��ͨ 
	TIME_INSTANT			= 2, //˲�� 
};

enum 
{
	BAR_SHOW_NO				= 1, //����ʾ
	BAR_SHOW_PRAY			= 2, //����
	BAR_SHOW_CHANNEL		= 3, //ͨ��
	BAR_SHOW_CHARGE			= 4, //����
	BAR_SHOW_BTN_CHANNEL	= 5, //����ʽͨ��
};

enum 
{
	AUTOATTACK_ACTIVATE		= 0, //�����Զ�����
	AUTOATTACK_STOP			= 1, //ֹͣ�Զ�����
	AUTOATTACK_NO_BEAFFECT	= 2, //��Ӱ���Զ�����
	
};

enum 
{
	CONDITION_NORMAL		= 0, //û����������
	CONDITION_GROUND		= 1, //������״̬��ʹ�� 
	CONDITION_MOUNT			= 2, //�����״̬��ʹ�� 
	CONDITION_ABS_GROUND	= 3, //���Ե���
};

enum 
{
	TARGET_NORMAL			= 0, //��ͨ
	TARGET_BODY				= 1, //ʬ��
};

enum 
{
	DELAY_NORMAL			= 1, //��ͨ��ʱ 
	DELAY_FLY				= 2, //������ʱ
};

enum EVENT
{
	EVENT_RESET				= 0x01, //��������
	EVENT_CHANGE			= 0x02, //����ְҵ 
};

enum 
{
	EXTRA_NONE				= 0, //��
	EXTRA_XP				= 1, //XP����
	EXTRA_PETAUTO			= 2, //�����Զ��ͷ�
	EXTRA_MONSTER_BAR		= 3, //��ʾ����������
	EXTRA_HUG				= 4, //��ˤ
	EXTRA_CAST				= 5, //Ͷ��
	EXTRA_BEAT_FLY			= 6, //����
};

enum 
{
	SWITCHON_COOL			= 0, //�򿪺���ȴ
	SWITCHOFF_COOL			= 1, //�رպ���ȴ
};

enum 
{
	HP_BLOW					= 1, 
	HP_ABOVE				= 2, 
	MP_BLOW					= 3, 
	MP_ABOVE				= 4, 
};

//	Mask of some special extend states which will influence player game logic.
//	Logic Influence Extned states
enum
{
	LIES_ROOT			= 0x0001,	// ��ֹ�ƶ�
	LIES_DISABLE_SKILL	= 0x0002,	// ��ֹ�ͷż��ܣ��������չ���
	LIES_DISABLE_MELEE	= 0x0004,	// ��ֹ�չ�
	LIES_STUN			= 0x0008,	// ����
	LIES_DRIFT			= 0x0010,	// ����
	LIES_DOWN			= 0x0020,	// ����
	LIES_DIET			= 0x0040,	// ��ʳ
};

enum AFFECT_TYPE
{       
	AT_SELF                 = 0x00000001,
	AT_TEAM                 = 0x00000002,
	AT_FRIEND_PLAYER        = 0x00000004,
	AT_ENEMY_PLAYER         = 0x00000008,
	AT_FRIEND_NPC           = 0x00000010,
	AT_ENEMY_NPC            = 0x00000020,
	AT_SPECIFIC_NPC         = 0x00000040,
	AT_FRIEND_PET			= 0x00000080,
	AT_ENEMY_PET			= 0x00000100,
	AT_MASTER				= 0x00000200,
};

//filter
enum 
{
	BUFF_TIME_INSTANT		= 0, //˲�� ʱ������
	BUFF_TIME_FINITE		= 1, //���� ʱ������
	BUFF_TIME_INFINITE		= 2, //���� ʱ������
};

enum 
{
	EFFECT_BEGIN 			= 0x00000001, //�����Ч
	EFFECT_DELAY			= 0x00000002, //��ʱ��Ч
	EFFECT_HIT				= 0x00000004, //������Ч
	EFFECT_DODGE			= 0x00000008, //������Ч  
	EFFECT_BEHIT			= 0x00000010, //��������Ч 
	EFFECT_BEINJURE			= 0x00000020, //����Ѫ��Ч  
	EFFECT_KILL				= 0x00000040, //ɱ����Ч 
	EFFECT_VALID_KILL		= 0x00000080, //��Чɱ����Ч
	EFFECT_INVALID_KILL		= 0x00000100, //��Чɱ����Ч 
	EFFECT_BELOW_HP			= 0x00000200, //����Ѫ�����ڰٷֱ�ʱ ��Ч 
	EFFECT_ABOVE_HP			= 0x00000400, //����Ѫ�����ڰٷֱ�ʱ ��Ч 
	EFFECT_BELOW_MP			= 0x00000800, //����ħ�����ڰٷֱ�ʱ ��Ч 
	EFFECT_ABOVE_MP			= 0x00001000, //����ħ�����ڰٷֱ�ʱ ��Ч 
	EFFECT_BELOW_VP			= 0x00002000, //����Ԫ�����ڰٷֱ�ʱ ��Ч 
	EFFECT_ABOVE_VP			= 0x00004000, //����Ԫ�����ڰٷֱ�ʱ ��Ч 
	EFFECT_BEFORE_DEATH		= 0x00008000, //���� ��������ʱ ��Ч 
	EFFECT_STATE			= 0x00010000, //���������ĳ״̬ ��Ч 
	EFFECT_INJURE			= 0x00020000, //�Է���Ѫ��Ч  
};

enum 
{
	OVER_HIT					= 0x00100000, //���ͼ�����
	OVER_COMBAT					= 0x00200000, //����ս��ʱ ״̬����
	OVER_CHANGE					= 0x00400000, //�л����� ״̬����
	OVER_DEATH					= 0x00800000, //�������� ״̬����
	OVER_OFFLINE				= 0x01000000, //�������� ״̬���� 
	OVER_STOPCHANNEL			= 0x02000000, //��ֹʱ����ͨ�� 
	OVER_SWITCH_PROFESSION		= 0x04000000, //�л�ְҵ ״̬����
};

enum 
{
	ADD_NORMAL						= 0, //ֱ�Ӽ���;
	ADD_PRAY						= 1, //���������м��� 
	ADD_COMBAT						= 2, //����ս��״̬ �����
	ADD_CRIT						= 3, //������ �����
	ADD_NOT_COMBAT					= 4, //û�д���ս��״̬����� 
	ADD_HAVE_STATEBAG				= 5, //��ĳ״̬�������
	ADD_HAVE_CHAR_PROP_STATE_BIT	= 6, //��ĳ��ɫ����״̬λ�����
};

enum 
{ 
	RULE_WEAK				= 1, //������ζ�ʧ�ܣ�������ͬID״̬�����򲻼ӱ���
	RULE_UNIQUE				= 2, //������ζ��ɹ����ǣ�������ͬID״̬�����򸲸�ԭ����ͬID��״̬�������ӱ���   
	RULE_TIMEPRIOR			= 3, //״̬����ʱ���������ɹ����� 
	RULE_DATAPRIOR			= 4, //��һЧ����ֵ����ֵ������ɹ����� 
	RULE_ISOLATE			= 5, //����
	RULE_ATTACH				= 6, //���� 
	RULE_TIMERESET			= 7, //����ʱ��
	RULE_SUM_TIMEPRIOR		= 8, //���״̬�ܳ���ʱ���������ɹ����� 
};

enum 
{
	CTRL_MODIFY				= 0, //����filter 
	CTRL_GETBUFFLEVEL		= 1, //��ȡ���Ӵ���
};

}

#endif
