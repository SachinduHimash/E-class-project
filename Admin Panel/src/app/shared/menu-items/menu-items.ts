import {Injectable} from '@angular/core';

export interface Menu {
  state: string; // name_of_route
  name: string;
  type: string;
  icon: string;
}

const MENUITEMS = [
  // {
  //   state: 'dashboard',
  //   name: 'Dashboard',
  //   type: 'link',
  //   icon: 'home'
  // },
  {
    state: 'classes',
    name: 'Classes',
    type: 'link',
    icon: 'class'
  },
  {
    state: 'students',
    name: 'Students',
    type: 'link',
    icon: 'face'
  },
  {
    state: 'leaderboard',
    name: 'Leaderboard',
    type: 'link',
    icon: 'assessment'
  },
  {
    state: 'papers',
    name: 'Papers',
    type: 'link',
    icon: 'description'
  },
  {
    state: 'access',
    name: 'Papers Access',
    type: 'link',
    icon: 'timer'
  },
  {
    state: 'admins',
    name: 'Admins',
    type: 'link',
    icon: 'verified_user'
  },
  {
    state: 'profile',
    name: 'Profile',
    type: 'link',
    icon: 'account_circle'
  }
  ];

@Injectable()
export class MenuItems {
  getMenuitem(): Menu[] {
    return MENUITEMS;
  }
}

// original_MENUITEMS_on_template

// const MENUITEMS = [
//   { state: 'dashboard', name: 'Dashboard', type: 'link', icon: 'av_timer' },
//   { state: 'button', type: 'link', name: 'Buttons', icon: 'crop_7_5' },
//   { state: 'grid', type: 'link', name: 'Grid List', icon: 'view_comfy' },
//   { state: 'lists', type: 'link', name: 'Lists', icon: 'view_list' },
//   { state: 'menu', type: 'link', name: 'Menu', icon: 'view_headline' },
//   { state: 'tabs', type: 'link', name: 'Tabs', icon: 'tab' },
//   { state: 'stepper', type: 'link', name: 'Stepper', icon: 'web' },
//   {
//     state: 'expansion',
//     type: 'link',
//     name: 'Expansion Panel',
//     icon: 'vertical_align_center'
//   },
//   { state: 'chips', type: 'link', name: 'Chips', icon: 'vignette' },
//   { state: 'toolbar', type: 'link', name: 'Toolbar', icon: 'voicemail' },
//   {
//     state: 'progress-snipper',
//     type: 'link',
//     name: 'Progress snipper',
//     icon: 'border_horizontal'
//   },
//   {
//     state: 'progress',
//     type: 'link',
//     name: 'Progress Bar',
//     icon: 'blur_circular'
//   },
//   {
//     state: 'dialog',
//     type: 'link',
//     name: 'Dialog',
//     icon: 'assignment_turned_in'
//   },
//   { state: 'tooltip', type: 'link', name: 'Tooltip', icon: 'assistant' },
//   { state: 'snackbar', type: 'link', name: 'Snackbar', icon: 'adb' },
//   { state: 'slider', type: 'link', name: 'Slider', icon: 'developer_mode' },
//   {
//     state: 'slide-toggle',
//     type: 'link',
//     name: 'Slide Toggle',
//     icon: 'all_inclusive'
//   }
// ];
