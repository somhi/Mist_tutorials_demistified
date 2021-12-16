#ifndef MENU_H
#define MENU_H

#define TIMERBASE 0xffffffc8
#define HW_TIMER(x) *(volatile unsigned int *)(TIMERBASE+x)
#define REG_MILLISECONDS 0

#define JOYBASE 0xffffffe8
#define HW_JOY(x) *(volatile unsigned int *)(JOYBASE+x)
#define REG_JOY 0
#define REG_JOY_EXTRA 4

#define JOY_BUTTON_MENU 1

#define ROW_LINEUP -1
#define ROW_LINEDOWN -2
#define ROW_PAGEUP -3
#define ROW_PAGEDOWN -4

typedef long menu_action;
#define MENU_ACTION(x) ((long)(x))
#define MENU_ACTION_CALLBACK(x) ((void (*)(int row))x)

extern char menu_longpress;

struct menu_entry
{
	menu_action action;	
	char *label;
	union {
		/*	Options consist of a variable, the maximum allowed value,
			and the option's position within the config string. */
		struct {
			unsigned char val;
			unsigned char limit;
			unsigned char shift;
		} opt;
		struct {
			unsigned char page;
		} menu;
		/*	Files require an index to be used when uploading,
			the config string entry from which the file extensions can be retrieved
			and a unit number so the firmware knows what to do with the file. */
		struct {
			unsigned char index;
			unsigned char cfgidx;
			unsigned char unit;
		} file;
	} u;
};

struct hotkey
{
	int key;
	void (*callback)(int row);
};


void Menu_ShowHide(int visible);
void Menu_Draw();
void Menu_Set(struct menu_entry *head);
void Menu_SetHotKeys(struct hotkey *head);
void Menu_Run();
int Menu_Visible();

extern int scandouble;
void SetScandouble(int sd);

extern int joya,joyb;

#endif
